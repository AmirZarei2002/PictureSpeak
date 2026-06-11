import { Role } from '@prisma/client';
import * as bcrypt from 'bcrypt';
import { createPrismaClient } from 'src/prisma/create-prisma-client';

const prisma = createPrismaClient();

async function bootstrapAdmin() {
  const email = process.env.ADMIN_EMAIL;
  const password = process.env.ADMIN_PASSWORD;

  if (!email || !password) {
    console.error(
      '❌ ADMIN_EMAIL and ADMIN_PASSWORD must be set in the environment.',
    );
    return false;
  }

  const existing = await prisma.user.findUnique({ where: { email } });

  if (existing) {
    if (existing.role === Role.ADMIN) {
      console.log(`✅ Admin already exists for ${email} — nothing to do.`);
      return true;
    }
    await prisma.user.update({
      where: { id: existing.id },
      data: { role: Role.ADMIN },
    });
    console.log(`✅ Promoted existing user ${email} to ADMIN.`);
    return true;
  }

  const passwordHash = await bcrypt.hash(password, 10);
  await prisma.user.create({
    data: {
      email,
      passwordHash,
      isGuest: false,
      role: Role.ADMIN,
      displayName: 'Admin',
    },
  });
  console.log(`✅ Created admin user ${email}.`);
  return true;
}

if (require.main === module) {
  bootstrapAdmin()
    .then((ok) => process.exit(ok ? 0 : 1))
    .catch((e) => {
      console.error('Bootstrap error:', e);
      process.exit(1);
    })
    .finally(() => {
      void prisma.$disconnect();
    });
}

export { bootstrapAdmin };
