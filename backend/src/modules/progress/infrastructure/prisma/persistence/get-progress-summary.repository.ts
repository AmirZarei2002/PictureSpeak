import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import {
  CategoryProgress,
  ProgressSummaryEntity,
} from '@modules/progress/domain/entities/progress-summary.entity';
import { IGetProgressSummaryRepository } from '@modules/progress/domain/interfaces/progress.repository.interface';

@Injectable()
export class GetProgressSummaryRepository implements IGetProgressSummaryRepository {
  constructor(private readonly prisma: PrismaService) {}

  async getSummary(userId: string): Promise<ProgressSummaryEntity> {
    const [totals, exploredRows, categories] = await Promise.all([
      this.prisma.progress.aggregate({
        where: { userId },
        _sum: { viewCount: true, listenCount: true },
        _count: { _all: true },
      }),
      this.prisma.progress.findMany({
        where: { userId },
        select: { item: { select: { categoryId: true } } },
      }),
      this.prisma.category.findMany({
        where: { isActive: true },
        orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
        include: {
          _count: {
            select: { items: { where: { isActive: true } } },
          },
        },
      }),
    ]);

    const exploredByCategory = new Map<string, number>();
    for (const row of exploredRows) {
      const cid = row.item.categoryId;
      exploredByCategory.set(cid, (exploredByCategory.get(cid) ?? 0) + 1);
    }

    const byCategory: CategoryProgress[] = categories.map(
      (c) =>
        new CategoryProgress(
          c.id,
          c.slug,
          c.name,
          exploredByCategory.get(c.id) ?? 0,
          c._count.items,
        ),
    );

    return new ProgressSummaryEntity(
      totals._sum.viewCount ?? 0,
      totals._sum.listenCount ?? 0,
      totals._count._all,
      byCategory,
    );
  }
}
