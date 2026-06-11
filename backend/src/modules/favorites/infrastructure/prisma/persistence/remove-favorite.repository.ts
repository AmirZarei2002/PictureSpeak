import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { IRemoveFavoriteRepository } from '@modules/favorites/domain/interfaces/favorites.repository.interface';

@Injectable()
export class RemoveFavoriteRepository implements IRemoveFavoriteRepository {
  constructor(private readonly prisma: PrismaService) {}

  async remove(userId: string, itemId: string): Promise<void> {
    await this.prisma.favorite.deleteMany({
      where: { userId, itemId },
    });
  }
}
