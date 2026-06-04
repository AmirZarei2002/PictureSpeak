import { PrismaService } from '@prisma/prisma.service';

export async function getDefaultRoleId(prisma: PrismaService): Promise<string> {
  const defaultRole = await prisma.role.findUnique({
    where: { name: 'user' },
    select: { id: true },
  });

  console.log('defaultRole', defaultRole);

  if (!defaultRole) {
    throw new Error(
      'Default role not found. Please seed roles in the database.',
    );
  }

  return defaultRole.id;
}
