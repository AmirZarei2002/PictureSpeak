import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import {
  ActiveUsersEntity,
  DauPoint,
} from '@modules/admin-analytics/domain/entities/active-users.entity';
import { IActiveUsersRepository } from '@modules/admin-analytics/domain/interfaces/analytics.repository.interface';

@Injectable()
export class ActiveUsersRepository implements IActiveUsersRepository {
  constructor(private readonly prisma: PrismaService) {}

  async getActiveUsers(windowDays: number): Promise<ActiveUsersEntity> {
    const now = new Date();
    const windowStart = this.daysAgo(windowDays);

    const [dau, wau, mau, raw] = await Promise.all([
      this.distinctUsersSince(this.daysAgo(1)),
      this.distinctUsersSince(this.daysAgo(7)),
      this.distinctUsersSince(this.daysAgo(30)),
      this.prisma.$queryRaw<{ day: Date; count: bigint }[]>`
        SELECT DATE_TRUNC('day', "lastSeenAt") AS day,
               COUNT(DISTINCT "userId") AS count
        FROM "Progress"
        WHERE "lastSeenAt" >= ${windowStart}
        GROUP BY day
        ORDER BY day ASC
      `,
    ]);

    const byDay = new Map<string, number>();
    for (const r of raw) {
      byDay.set(this.iso(r.day), Number(r.count));
    }

    const series: DauPoint[] = [];
    for (let i = windowDays - 1; i >= 0; i--) {
      const d = new Date(now);
      d.setUTCDate(d.getUTCDate() - i);
      const key = this.iso(d);
      series.push(new DauPoint(key, byDay.get(key) ?? 0));
    }

    return new ActiveUsersEntity(windowDays, dau, wau, mau, series);
  }

  private async distinctUsersSince(since: Date): Promise<number> {
    const result = await this.prisma.$queryRaw<{ count: bigint }[]>`
      SELECT COUNT(DISTINCT "userId") AS count
      FROM "Progress"
      WHERE "lastSeenAt" >= ${since}
    `;
    return Number(result[0]?.count ?? 0);
  }

  private daysAgo(n: number): Date {
    const d = new Date();
    d.setUTCDate(d.getUTCDate() - n);
    return d;
  }

  private iso(d: Date): string {
    return d.toISOString().substring(0, 10);
  }
}
