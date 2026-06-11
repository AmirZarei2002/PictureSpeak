import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { IAddFavoriteRepository } from '@modules/favorites/domain/interfaces/favorites.repository.interface';

@Injectable()
export class AddFavoriteRepository implements IAddFavoriteRepository {
  constructor(private readonly prisma: PrismaService) {}

  async add(userId: string, itemId: string): Promise<void> {
    await this.prisma.favorite.upsert({
      where: { userId_itemId: { userId, itemId } },
      update: {},
      create: { userId, itemId },
    });
  }
}
