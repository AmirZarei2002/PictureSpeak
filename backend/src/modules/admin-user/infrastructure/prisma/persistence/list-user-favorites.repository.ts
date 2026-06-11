import { Injectable } from '@nestjs/common';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { PrismaService } from '@prisma/prisma.service';
import { IListUserFavoritesRepository } from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';
import { FavoriteItemEntity } from '@modules/favorites/domain/entities/favorite-item.entity';

@Injectable()
export class ListUserFavoritesRepository implements IListUserFavoritesRepository {
  constructor(private readonly prisma: PrismaService) {}

  async list(
    userId: string,
    page: number,
    size: number,
  ): Promise<PaginatedResult<FavoriteItemEntity>> {
    const skip = (page - 1) * size;

    const [total, favorites] = await Promise.all([
      this.prisma.favorite.count({ where: { userId } }),
      this.prisma.favorite.findMany({
        where: { userId },
        orderBy: { createdAt: 'desc' },
        skip,
        take: size,
        include: { item: { include: { category: true } } },
      }),
    ]);

    const data = favorites.map(
      (f) =>
        new FavoriteItemEntity(
          f.item.id,
          f.item.slug,
          f.item.name,
          f.item.imagePath,
          f.item.thumbnailPath,
          f.item.audioPath,
          f.item.category.id,
          f.item.category.slug,
          f.item.category.name,
          f.item.category.colorHex,
          f.createdAt,
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
