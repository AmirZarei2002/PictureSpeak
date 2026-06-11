import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { ILearningItemExistsRepository } from '@modules/favorites/domain/interfaces/favorites.repository.interface';

@Injectable()
export class LearningItemExistsRepository implements ILearningItemExistsRepository {
  constructor(private readonly prisma: PrismaService) {}

  async exists(itemId: string): Promise<boolean> {
    const found = await this.prisma.learningItem.findUnique({
      where: { id: itemId },
      select: { id: true },
    });
    return found !== null;
  }
}
