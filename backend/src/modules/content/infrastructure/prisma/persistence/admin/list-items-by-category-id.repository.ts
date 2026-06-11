import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import { IListItemsByCategoryIdRepository } from '@modules/content/domain/interfaces/content.repository.interface';
import { LearningItemMapper } from '@modules/content/domain/mappers/learning-item.mapper';

@Injectable()
export class ListItemsByCategoryIdRepository implements IListItemsByCategoryIdRepository {
  constructor(private readonly prisma: PrismaService) {}

  async list(categoryId: string): Promise<LearningItemEntity[]> {
    const items = await this.prisma.learningItem.findMany({
      where: { categoryId },
      orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
    });
    return items.map((i) => LearningItemMapper.toEntity(i));
  }
}
