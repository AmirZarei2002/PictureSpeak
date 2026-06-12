import { createPrismaClient } from '../src/prisma/create-prisma-client';

const prisma = createPrismaClient();

async function checkDatabaseHealth() {
  console.log('🔍 Checking database health...');

  try {
    await prisma.$queryRaw`SELECT 1`;
    console.log('✅ Database connection: OK');

    const tables = await prisma.$queryRaw<Array<{ tablename: string }>>`
      SELECT tablename FROM pg_tables WHERE schemaname = 'public'
    `;

    const expectedTables = [
      'User',
      'Category',
      'LearningItem',
      'Favorite',
      'Progress',
    ];

    const existingTables = tables.map((t) => t.tablename);
    const missingTables = expectedTables.filter(
      (table) => !existingTables.includes(table),
    );

    if (missingTables.length > 0) {
      console.error('❌ Missing tables:', missingTables);
      return false;
    }

    console.log('✅ All expected tables exist');

    await prisma.user.findFirst();
    await prisma.category.findFirst();
    await prisma.learningItem.findFirst();
    await prisma.favorite.findFirst();
    await prisma.progress.findFirst();

    console.log('✅ All tables are accessible');
    console.log('🎉 Database health check passed!');
    return true;
  } catch (error) {
    console.error('❌ Database health check failed:', error);
    return false;
  } finally {
    await prisma.$disconnect();
  }
}

if (require.main === module) {
  checkDatabaseHealth().then((success) => {
    process.exit(success ? 0 : 1);
  });
}

export { checkDatabaseHealth };
