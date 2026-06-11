import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { TopCategoryEntity } from '@modules/admin-analytics/domain/entities/top-category.entity';
import { ITopCategoriesRepository } from '@modules/admin-analytics/domain/interfaces/analytics.repository.interface';

@Injectable()
export class TopCategoriesRepository implements ITopCategoriesRepository {
  constructor(private readonly prisma: PrismaService) {}

  async getTopCategories(limit: number): Promise<TopCategoryEntity[]> {
    const rows = await this.prisma.$queryRaw<
      { categoryId: string; favoriteCount: bigint }[]
    >`
      SELECT i."categoryId" AS "categoryId",
             COUNT(f.*) AS "favoriteCount"
      FROM "Favorite" f
      JOIN "LearningItem" i ON i.id = f."itemId"
      GROUP BY i."categoryId"
      ORDER BY "favoriteCount" DESC
      LIMIT ${limit}
    `;

    if (rows.length === 0) return [];

    const categories = await this.prisma.category.findMany({
      where: { id: { in: rows.map((r) => r.categoryId) } },
    });
    const byId = new Map(categories.map((c) => [c.id, c]));

    return rows
      .map((r) => {
        const cat = byId.get(r.categoryId);
        if (!cat) return null;
        return new TopCategoryEntity(
          cat.id,
          cat.slug,
          cat.name,
          cat.colorHex,
          Number(r.favoriteCount),
        );
      })
      .filter((x): x is TopCategoryEntity => x !== null);
  }
}
