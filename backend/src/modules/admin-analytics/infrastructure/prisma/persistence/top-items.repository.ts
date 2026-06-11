import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { TopItemEntity } from '@modules/admin-analytics/domain/entities/top-item.entity';
import { ITopItemsRepository } from '@modules/admin-analytics/domain/interfaces/analytics.repository.interface';

@Injectable()
export class TopItemsRepository implements ITopItemsRepository {
  constructor(private readonly prisma: PrismaService) {}

  async getTopItems(limit: number, days?: number): Promise<TopItemEntity[]> {
    const where = days
      ? { lastSeenAt: { gte: this.daysAgo(days) } }
      : undefined;

    const grouped = await this.prisma.progress.groupBy({
      by: ['itemId'],
      where,
      _sum: { viewCount: true, listenCount: true },
      orderBy: { _sum: { viewCount: 'desc' } },
      take: limit,
    });

    if (grouped.length === 0) return [];

    const items = await this.prisma.learningItem.findMany({
      where: { id: { in: grouped.map((g) => g.itemId) } },
      include: { category: true },
    });
    const byId = new Map(items.map((i) => [i.id, i]));

    return grouped
      .map((g) => {
        const item = byId.get(g.itemId);
        if (!item) return null;
        return new TopItemEntity(
          item.id,
          item.slug,
          item.name,
          item.category.id,
          item.category.slug,
          item.category.name,
          g._sum.viewCount ?? 0,
          g._sum.listenCount ?? 0,
        );
      })
      .filter((x): x is TopItemEntity => x !== null);
  }

  private daysAgo(n: number): Date {
    const d = new Date();
    d.setUTCDate(d.getUTCDate() - n);
    return d;
  }
}
