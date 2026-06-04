import { PrismaService } from '@prisma/prisma.service';

const prisma = new PrismaService();

export async function seedRoles() {
  const roles = [{ name: 'admin' }, { name: 'user' }];

  for (const role of roles) {
    await prisma.role.upsert({
      where: { name: role.name },
      update: {},
      create: role,
    });
  }

  console.log('✅ Roles seeded successfully');
}
