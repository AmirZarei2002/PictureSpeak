import { Injectable } from '@nestjs/common';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { PrismaService } from '@prisma/prisma.service';
import { UserProgressRowEntity } from '@modules/admin-user/domain/entities/user-progress-row.entity';
import { IListUserProgressRepository } from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';

@Injectable()
export class ListUserProgressRepository implements IListUserProgressRepository {
  constructor(private readonly prisma: PrismaService) {}

  async list(
    userId: string,
    page: number,
    size: number,
  ): Promise<PaginatedResult<UserProgressRowEntity>> {
    const skip = (page - 1) * size;

    const [total, rows] = await Promise.all([
      this.prisma.progress.count({ where: { userId } }),
      this.prisma.progress.findMany({
        where: { userId },
        orderBy: { lastSeenAt: 'desc' },
        skip,
        take: size,
        include: { item: { include: { category: true } } },
      }),
    ]);

    const data = rows.map(
      (r) =>
        new UserProgressRowEntity(
          r.item.id,
          r.item.slug,
          r.item.name,
          r.item.category.id,
          r.item.category.slug,
          r.item.category.name,
          r.viewCount,
          r.listenCount,
          r.firstSeenAt,
          r.lastSeenAt,
        ),
    );

    const lastPage = Math.ceil(total / size);
    return {
      data,
      meta: {
        total,
        page,
        size,
        lastPage,
        prevPage: page > 1 ? page - 1 : null,
        nextPage: page < lastPage ? page + 1 : null,
      },
    };
  }
}
