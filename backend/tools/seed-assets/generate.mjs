// Generates all content assets (image.png + thumb.webp + audio.mp3) under
// backend/uploads/, plus category cover images. Idempotent: re-running
// overwrites all assets. Run with: node generate.mjs [--skip-existing]
import { MsEdgeTTS, OUTPUT_FORMAT } from 'msedge-tts';
import sharp from 'sharp';
import { mkdirSync, writeFileSync, existsSync, copyFileSync } from 'node:fs';
import { join, dirname, resolve } from 'node:path';
import { dataset } from './dataset.mjs';

const ROOT = resolve(dirname(new URL(import.meta.url).pathname.replace(/^\/([a-zA-Z]:)/, '$1')), '../..');
const UPLOADS = join(ROOT, 'uploads');
const VOICE = 'fa-IR-DilaraNeural';
const UA = 'PictureSpeak-seed/1.0 (educational; contact: dev@picturespeak.local)';
const SKIP_EXISTING = process.argv.includes('--skip-existing');

const IMG_SIZE = 600;
const THUMB_SIZE = 200;

function colorSvg(hex) {
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600">
  <rect width="600" height="600" fill="${hex}"/>
  <rect x="6" y="6" width="588" height="588" fill="none" stroke="rgba(0,0,0,0.15)" stroke-width="3"/>
</svg>`;
}

function numberSvg(numeral) {
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600">
  <rect width="600" height="600" fill="#FFFBEA"/>
  <text x="300" y="380" text-anchor="middle" font-family="Vazirmatn, Tahoma, Arial" font-size="380" font-weight="800" fill="#2D3142">${numeral}</text>
</svg>`;
}

function shapeSvg(shape) {
  const FILL = '#5DA9E9';
  const STROKE = '#1D6FB8';
  const SW = 8;
  const body = ({
    circle:    `<circle cx="300" cy="300" r="220" fill="${FILL}" stroke="${STROKE}" stroke-width="${SW}"/>`,
    square:    `<rect x="100" y="100" width="400" height="400" fill="${FILL}" stroke="${STROKE}" stroke-width="${SW}"/>`,
    rectangle: `<rect x="60" y="170" width="480" height="260" fill="${FILL}" stroke="${STROKE}" stroke-width="${SW}"/>`,
    triangle:  `<polygon points="300,90 540,500 60,500" fill="${FILL}" stroke="${STROKE}" stroke-width="${SW}" stroke-linejoin="round"/>`,
    oval:      `<ellipse cx="300" cy="300" rx="240" ry="170" fill="${FILL}" stroke="${STROKE}" stroke-width="${SW}"/>`,
    star:      `<polygon points="300,80 360,235 525,235 392,330 445,495 300,395 155,495 208,330 75,235 240,235" fill="${FILL}" stroke="${STROKE}" stroke-width="${SW}" stroke-linejoin="round"/>`,
    heart:     `<path d="M300 510 C 80 360, 80 150, 240 150 C 300 150, 300 200, 300 240 C 300 200, 300 150, 360 150 C 520 150, 520 360, 300 510 Z" fill="${FILL}" stroke="${STROKE}" stroke-width="${SW}" stroke-linejoin="round"/>`,
  })[shape] || `<rect x="100" y="100" width="400" height="400" fill="${FILL}"/>`;
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600">
  <rect width="600" height="600" fill="#FFFBEA"/>
  ${body}
</svg>`;
}

async function fetchWiki(slug) {
  const url = `https://en.wikipedia.org/api/rest_v1/page/summary/${encodeURIComponent(slug)}`;
  const r = await fetch(url, { headers: { 'User-Agent': UA } });
  if (!r.ok) throw new Error(`wiki summary ${slug}: ${r.status}`);
  const j = await r.json();
  const src = j.originalimage?.source || j.thumbnail?.source;
  if (!src) throw new Error(`wiki ${slug}: no image`);
  const ir = await fetch(src, { headers: { 'User-Agent': UA } });
  if (!ir.ok) throw new Error(`wiki image ${slug}: ${ir.status}`);
  return Buffer.from(await ir.arrayBuffer());
}

async function sourceImage(item) {
  if (item.kind === 'wiki')   return await fetchWiki(item.wiki);
  if (item.kind === 'color')  return Buffer.from(colorSvg(item.hex));
  if (item.kind === 'number') return Buffer.from(numberSvg(item.numeral));
  if (item.kind === 'shape')  return Buffer.from(shapeSvg(item.shape));
  throw new Error(`unknown kind: ${item.kind}`);
}

async function writeImageAndThumb(srcBuf, outDir) {
  // sharp auto-detects svg/png/jpg/webp from buffer header.
  await sharp(srcBuf)
    .resize(IMG_SIZE, IMG_SIZE, { fit: 'cover', position: 'attention' })
    .png({ compressionLevel: 9 })
    .toFile(join(outDir, 'image.png'));
  await sharp(srcBuf)
    .resize(THUMB_SIZE, THUMB_SIZE, { fit: 'cover', position: 'attention' })
    .webp({ quality: 82 })
    .toFile(join(outDir, 'thumb.webp'));
}

// Single TTS instance reused across all items (one WebSocket).
const tts = new MsEdgeTTS();
await tts.setMetadata(VOICE, OUTPUT_FORMAT.AUDIO_24KHZ_48KBITRATE_MONO_MP3);

async function writeAudio(text, outPath) {
  const { audioStream } = tts.toStream(text);
  const chunks = [];
  audioStream.on('data', (c) => chunks.push(c));
  await new Promise((res, rej) => {
    audioStream.on('close', res);
    audioStream.on('error', rej);
  });
  writeFileSync(outPath, Buffer.concat(chunks));
}

const failures = [];
const itemImagePathByKey = new Map(); // `${cat}/${item}` -> absolute image.png path

let total = 0;
for (const cat of dataset.categories) total += cat.items.length;
let done = 0;

for (const cat of dataset.categories) {
  for (const item of cat.items) {
    done++;
    const outDir = join(UPLOADS, 'items', cat.slug, item.slug);
    mkdirSync(outDir, { recursive: true });
    const imgPath = join(outDir, 'image.png');
    const audioPath = join(outDir, 'audio.mp3');
    itemImagePathByKey.set(`${cat.slug}/${item.slug}`, imgPath);

    if (SKIP_EXISTING && existsSync(imgPath) && existsSync(audioPath)) {
      console.log(`[${done}/${total}] skip ${cat.slug}/${item.slug}`);
      continue;
    }
    try {
      const src = await sourceImage(item);
      await writeImageAndThumb(src, outDir);
      await writeAudio(item.name, audioPath);
      console.log(`[${done}/${total}] ok   ${cat.slug}/${item.slug} (${item.name})`);
    } catch (e) {
      console.error(`[${done}/${total}] FAIL ${cat.slug}/${item.slug}: ${e.message}`);
      failures.push({ cat: cat.slug, item: item.slug, err: e.message });
    }
  }
}

// Category covers: copy chosen item's image.
for (const cat of dataset.categories) {
  const srcKey = `${cat.slug}/${cat.coverFrom}`;
  const src = itemImagePathByKey.get(srcKey);
  const coverDir = join(UPLOADS, 'categories', cat.slug);
  mkdirSync(coverDir, { recursive: true });
  const coverPath = join(coverDir, 'cover.webp');
  if (src && existsSync(src)) {
    await sharp(src).resize(800, 500, { fit: 'cover', position: 'attention' }).webp({ quality: 85 }).toFile(coverPath);
    console.log(`cover ${cat.slug} <- ${cat.coverFrom}`);
  } else {
    console.warn(`cover ${cat.slug}: source missing (${srcKey})`);
  }
}

tts.close?.();

// Emit content-data.json next to the seed so seed.ts has a single source of truth.
const seedJsonPath = join(ROOT, 'src/modules/content/infrastructure/prisma/content-data.json');
const seedJson = {
  categories: dataset.categories.map((c) => ({
    slug: c.slug,
    name: c.name,
    colorHex: c.colorHex,
    sortOrder: c.sortOrder,
    items: c.items.map(({ slug, name }) => ({ slug, name })),
  })),
};
writeFileSync(seedJsonPath, JSON.stringify(seedJson, null, 2) + '\n', 'utf8');
console.log(`wrote ${seedJsonPath}`);

if (failures.length) {
  console.error(`\n${failures.length} failures:`);
  for (const f of failures) console.error(`  ${f.cat}/${f.item}: ${f.err}`);
  process.exit(1);
}
console.log(`\nDone. ${total} items, 0 failures.`);
