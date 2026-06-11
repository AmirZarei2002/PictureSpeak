import { PrismaClient } from '@prisma/client';
import contentData from './content-data.json';

interface ItemSeed {
  slug: string;
  name: string;
  sortOrder: number;
}

interface CategorySeed {
  slug: string;
  name: string;
  coverImagePath: string;
  colorHex: string;
  sortOrder: number;
  items: ItemSeed[];
}

interface ContentData {
  categories: Array<{
    slug: string;
    name: string;
    colorHex: string;
    sortOrder: number;
    items: Array<{ slug: string; name: string }>;
  }>;
}

const data = contentData as ContentData;

const categoriesData: CategorySeed[] = data.categories.map((c) => ({
  slug: c.slug,
  name: c.name,
  coverImagePath: `categories/${c.slug}/cover.webp`,
  colorHex: c.colorHex,
  sortOrder: c.sortOrder,
  items: c.items.map((i, idx) => ({
    slug: i.slug,
    name: i.name,
    sortOrder: idx + 1,
  })),
}));

const imagePathFor = (categorySlug: string, itemSlug: string): string =>
  `items/${categorySlug}/${itemSlug}/image.png`;

const thumbnailPathFor = (categorySlug: string, itemSlug: string): string =>
  `items/${categorySlug}/${itemSlug}/thumb.webp`;

const audioPathFor = (categorySlug: string, itemSlug: string): string =>
  `items/${categorySlug}/${itemSlug}/audio.mp3`;

export async function seedContent(prisma: PrismaClient): Promise<void> {
  console.log('🌱 Seeding content (categories + items)...');

  let categoryCount = 0;
  let itemCount = 0;

  for (const cat of categoriesData) {
    const category = await prisma.category.upsert({
      where: { slug: cat.slug },
      update: {
        name: cat.name,
        coverImagePath: cat.coverImagePath,
        colorHex: cat.colorHex,
        sortOrder: cat.sortOrder,
      },
      create: {
        slug: cat.slug,
        name: cat.name,
        coverImagePath: cat.coverImagePath,
        colorHex: cat.colorHex,
        sortOrder: cat.sortOrder,
      },
    });
    categoryCount++;

    const desiredSlugs = cat.items.map((i) => i.slug);
    await prisma.learningItem.deleteMany({
      where: {
        categoryId: category.id,
        slug: { notIn: desiredSlugs },
      },
    });

    for (const item of cat.items) {
      await prisma.learningItem.upsert({
        where: {
          categoryId_slug: { categoryId: category.id, slug: item.slug },
        },
        update: {
          name: item.name,
          imagePath: imagePathFor(cat.slug, item.slug),
          thumbnailPath: thumbnailPathFor(cat.slug, item.slug),
          audioPath: audioPathFor(cat.slug, item.slug),
          sortOrder: item.sortOrder,
        },
        create: {
          categoryId: category.id,
          slug: item.slug,
          name: item.name,
          imagePath: imagePathFor(cat.slug, item.slug),
          thumbnailPath: thumbnailPathFor(cat.slug, item.slug),
          audioPath: audioPathFor(cat.slug, item.slug),
          sortOrder: item.sortOrder,
        },
      });
      itemCount++;
    }
  }

  console.log(`✅ Content seeded: ${categoryCount} categories, ${itemCount} items`);
}
