import { PrismaClient } from '@prisma/client';
import {
  copyFileSync,
  existsSync,
  mkdirSync,
  readFileSync,
  rmSync,
} from 'node:fs';
import { extname, join } from 'node:path';
import { UPLOADS_ROOT } from '../../../upload/infrastructure/multer.config';

interface ItemSeed {
  slug: string;
  name: string;
  sortOrder: number;
  image: string;
  audio: string;
}

interface CategoryManifest {
  category: {
    slug: string;
    name: string;
    colorHex: string;
    sortOrder: number;
    coverImage: string;
  };
  items: ItemSeed[];
}

// Resolved at runtime so the same code works both for `pnpm seed` (cwd = backend/)
// and the Docker runner (cwd = /app/, with seed-data copied there by the Dockerfile).
const SEED_DATA_ROOT = join(process.cwd(), 'seed-data');

// Order here defines what survives the seed — any category whose slug is not
// listed gets deleted from the DB (cascading to its items + progress rows).
const SEEDED_CATEGORIES = ['fruits'] as const;

function readManifest(dir: string): CategoryManifest {
  const path = join(dir, 'manifest.json');
  return JSON.parse(readFileSync(path, 'utf-8')) as CategoryManifest;
}

function resetDir(dir: string): void {
  rmSync(dir, { recursive: true, force: true });
  mkdirSync(dir, { recursive: true });
}

async function seedCategoryFromDir(
  prisma: PrismaClient,
  sourceDir: string,
): Promise<void> {
  const { category, items } = readManifest(sourceDir);

  const coverExt = extname(category.coverImage).toLowerCase();
  const categoryUploadDir = join(UPLOADS_ROOT, 'categories', category.slug);
  resetDir(categoryUploadDir);
  copyFileSync(
    join(sourceDir, category.coverImage),
    join(categoryUploadDir, `cover${coverExt}`),
  );
  const coverImagePath = `categories/${category.slug}/cover${coverExt}`;

  const dbCategory = await prisma.category.upsert({
    where: { slug: category.slug },
    update: {
      name: category.name,
      coverImagePath,
      colorHex: category.colorHex,
      sortOrder: category.sortOrder,
    },
    create: {
      slug: category.slug,
      name: category.name,
      coverImagePath,
      colorHex: category.colorHex,
      sortOrder: category.sortOrder,
    },
  });

  await prisma.learningItem.deleteMany({
    where: {
      categoryId: dbCategory.id,
      slug: { notIn: items.map((i) => i.slug) },
    },
  });

  for (const item of items) {
    const imageExt = extname(item.image).toLowerCase();
    const audioExt = extname(item.audio).toLowerCase();
    const itemDir = join(UPLOADS_ROOT, 'items', category.slug, item.slug);
    // Reset the destination so a changed file extension (e.g. mp3 → aac) doesn't
    // leave a stale sibling behind that the API might still serve.
    resetDir(itemDir);
    copyFileSync(join(sourceDir, item.image), join(itemDir, `image${imageExt}`));
    copyFileSync(join(sourceDir, item.audio), join(itemDir, `audio${audioExt}`));

    const imagePath = `items/${category.slug}/${item.slug}/image${imageExt}`;
    const audioPath = `items/${category.slug}/${item.slug}/audio${audioExt}`;

    await prisma.learningItem.upsert({
      where: {
        categoryId_slug: { categoryId: dbCategory.id, slug: item.slug },
      },
      update: {
        name: item.name,
        imagePath,
        thumbnailPath: null,
        audioPath,
        sortOrder: item.sortOrder,
      },
      create: {
        categoryId: dbCategory.id,
        slug: item.slug,
        name: item.name,
        imagePath,
        audioPath,
        sortOrder: item.sortOrder,
      },
    });
  }

  console.log(`  ✓ ${category.slug}: ${items.length} items`);
}

export async function seedContent(prisma: PrismaClient): Promise<void> {
  console.log('🌱 Seeding content from seed-data/...');

  if (!existsSync(SEED_DATA_ROOT)) {
    throw new Error(`Seed data root not found at ${SEED_DATA_ROOT}`);
  }

  for (const slug of SEEDED_CATEGORIES) {
    await seedCategoryFromDir(prisma, join(SEED_DATA_ROOT, slug));
  }

  const removed = await prisma.category.deleteMany({
    where: { slug: { notIn: [...SEEDED_CATEGORIES] } },
  });
  if (removed.count > 0) {
    console.log(`  ✓ removed ${removed.count} stale categor${removed.count === 1 ? 'y' : 'ies'}`);
  }

  console.log('✅ Content seeded');
}
