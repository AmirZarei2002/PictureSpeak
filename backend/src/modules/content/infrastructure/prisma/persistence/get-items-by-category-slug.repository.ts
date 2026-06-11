import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import { IFindItemsByCategorySlugRepository } from '@modules/content/domain/interfaces/content.repository.interface';
import { LearningItemMapper } from '@modules/content/domain/mappers/learning-item.mapper';

@Injectable()
export class GetItemsByCategorySlugRepository implements IFindItemsByCategorySlugRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findByCategorySlug(slug: string): Promise<LearningItemEntity[] | null> {
    const category = await this.prisma.category.findUnique({
      where: { slug },
      select: { id: true, isActive: true },
    });

    if (!category || !category.isActive) {
      return null;
    }

    const items = await this.prisma.learningItem.findMany({
      where: { categoryId: category.id, isActive: true },
      orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
    });

    return items.map((i) => LearningItemMapper.toEntity(i));
  }
}
