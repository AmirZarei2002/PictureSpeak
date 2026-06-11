import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { FavoriteItemEntity } from '@modules/favorites/domain/entities/favorite-item.entity';
import { IFindFavoritesRepository } from '@modules/favorites/domain/interfaces/favorites.repository.interface';

@Injectable()
export class GetFavoritesRepository implements IFindFavoritesRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findAllForUser(userId: string): Promise<FavoriteItemEntity[]> {
    const favorites = await this.prisma.favorite.findMany({
      where: { userId },
      orderBy: { createdAt: 'desc' },
      include: { item: { include: { category: true } } },
    });

    return favorites.map(
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
  }
}
