import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import {
  CreateItemData,
  ICreateItemRepository,
} from '@modules/content/domain/interfaces/content.repository.interface';
import { LearningItemMapper } from '@modules/content/domain/mappers/learning-item.mapper';

@Injectable()
export class CreateItemRepository implements ICreateItemRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateItemData): Promise<LearningItemEntity> {
    const item = await this.prisma.learningItem.create({
      data: {
        categoryId: data.categoryId,
        slug: data.slug,
        name: data.name,
        imagePath: data.imagePath,
        thumbnailPath: data.thumbnailPath ?? null,
        audioPath: data.audioPath ?? null,
        ...(data.sortOrder !== undefined && { sortOrder: data.sortOrder }),
        ...(data.isActive !== undefined && { isActive: data.isActive }),
      },
    });
    return LearningItemMapper.toEntity(item);
  }
}
