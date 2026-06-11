import { seedContent } from '../modules/content/infrastructure/prisma/content.seed';
import { createPrismaClient } from './create-prisma-client';

const prisma = createPrismaClient();

async function main() {
  console.log('Starting database seeding...');

  try {
    await prisma.$queryRaw`SELECT 1`;
    console.log('✅ Database connection successful');
  } catch (error) {
    console.error('❌ Database connection failed:', error);
    throw error;
  }

  await seedContent(prisma);

  console.log('Database seeding completed.');
}

main()
  .catch((e) => {
    console.error('Seeding error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
