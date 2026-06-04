import { createPrismaClient } from '@prisma/create-prisma-client';
import { permissions } from '../../../../common/constants/permissions';

const prisma = createPrismaClient();

export async function seedPermissions() {
  for (const permission of permissions) {
    await prisma.permission.upsert({
      where: { name: permission.name },
      update: {},
      create: permission,
    });
  }

  console.log('✅ Permissions seeded successfully');
}
