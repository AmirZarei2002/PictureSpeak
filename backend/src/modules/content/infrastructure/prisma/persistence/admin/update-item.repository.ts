import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import {
  IUpdateItemRepository,
  UpdateItemData,
} from '@modules/content/domain/interfaces/content.repository.interface';
import { LearningItemMapper } from '@modules/content/domain/mappers/learning-item.mapper';

@Injectable()
export class UpdateItemRepository implements IUpdateItemRepository {
  constructor(private readonly prisma: PrismaService) {}

  async update(
    id: string,
    data: UpdateItemData,
  ): Promise<LearningItemEntity | null> {
    try {
      const item = await this.prisma.learningItem.update({
        where: { id },
        data,
      });
      return LearningItemMapper.toEntity(item);
    } catch (error) {
      if (
        error instanceof Prisma.PrismaClientKnownRequestError &&
        error.code === 'P2025'
      ) {
        return null;
      }
      throw error;
    }
  }
}
