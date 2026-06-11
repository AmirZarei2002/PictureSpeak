import { MsEdgeTTS, OUTPUT_FORMAT } from 'msedge-tts';
import { writeFileSync } from 'node:fs';
import { spawnSync } from 'node:child_process';

const tts = new MsEdgeTTS();
await tts.setMetadata('fa-IR-DilaraNeural', OUTPUT_FORMAT.AUDIO_24KHZ_48KBITRATE_MONO_MP3);
const { audioStream } = tts.toStream('سیب قرمز');

const chunks = [];
audioStream.on('data', (c) => chunks.push(c));
await new Promise((res, rej) => { audioStream.on('close', res); audioStream.on('error', rej); });
const buf = Buffer.concat(chunks);
writeFileSync('seeb.mp3', buf);
console.log('TTS wrote', buf.length, 'bytes');

// Image: fetch Wikipedia summary, download original image, resize.
const sum = await fetch('https://en.wikipedia.org/api/rest_v1/page/summary/Lion', {
  headers: { 'User-Agent': 'PictureSpeak-seed/1.0 (educational)' },
}).then((r) => r.json());
const imgUrl = sum.originalimage?.source || sum.thumbnail?.source;
console.log('img url:', imgUrl);

const ab = await fetch(imgUrl, { headers: { 'User-Agent': 'PictureSpeak-seed/1.0 (educational)' } }).then((r) => r.arrayBuffer());
writeFileSync('lion.raw', Buffer.from(ab));

const r1 = spawnSync('ffmpeg', ['-y', '-i', 'lion.raw', '-vf', 'scale=600:600:force_original_aspect_ratio=increase,crop=600:600', 'lion.png'], { encoding: 'utf8' });
const r2 = spawnSync('ffmpeg', ['-y', '-i', 'lion.raw', '-vf', 'scale=200:200:force_original_aspect_ratio=increase,crop=200:200', 'lion-thumb.webp'], { encoding: 'utf8' });
console.log('ffmpeg image:', r1.status, 'thumb:', r2.status);
