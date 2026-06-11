import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import { IFindItemBySlugInCategoryRepository } from '@modules/content/domain/interfaces/content.repository.interface';
import { LearningItemMapper } from '@modules/content/domain/mappers/learning-item.mapper';

@Injectable()
export class FindItemBySlugInCategoryRepository implements IFindItemBySlugInCategoryRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findBySlugInCategory(
    categoryId: string,
    slug: string,
  ): Promise<LearningItemEntity | null> {
    const item = await this.prisma.learningItem.findUnique({
      where: { categoryId_slug: { categoryId, slug } },
    });
    return item ? LearningItemMapper.toEntity(item) : null;
  }
}
