import { resolve } from 'path';
import { config } from 'dotenv';
import { PrismaPg } from '@prisma/adapter-pg';
import { PrismaClient, Prisma } from '@prisma/client';

function resolveDatabaseUrl(): string {
  config({ path: resolve(process.cwd(), '.env') });
  config({ path: resolve(process.cwd(), '.env.local'), override: true });
  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error('DATABASE_URL environment variable is not set');
  }
  return connectionString;
}

export function createPrismaClientOptions(
  log?: Prisma.LogLevel[],
): Prisma.PrismaClientOptions {
  const connectionString = resolveDatabaseUrl();
  const adapter = new PrismaPg({ connectionString });
  return {
    adapter,
    log: log ?? ['warn', 'error'],
  };
}

export function createPrismaClient(log?: Prisma.LogLevel[]): PrismaClient {
  return new PrismaClient(createPrismaClientOptions(log));
}
