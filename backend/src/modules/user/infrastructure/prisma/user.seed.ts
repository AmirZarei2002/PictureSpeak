import * as bcrypt from 'bcrypt';
import { createPrismaClient } from '@prisma/create-prisma-client';

const prisma = createPrismaClient();

export async function seedAdminUser() {
  const adminRole = await prisma.role.findUnique({
    where: { name: 'admin' },
  });

  if (!adminRole) {
    throw new Error('Admin role not found. Make sure roles are seeded first.');
  }

  const plainPassword = 'AmirZa2002@';
  const hashedPassword = await bcrypt.hash(plainPassword, 10);

  const adminUser = await prisma.user.upsert({
    where: { email: 'amirza@gmail.com' },
    update: {},
    create: {
      email: 'amirza@gmail.com',
      name: 'Amirza',
      password: hashedPassword,
      role: { connect: { id: adminRole.id } },
    },
  });

  console.log('✅ Admin user seeded:', adminUser.email);
}
