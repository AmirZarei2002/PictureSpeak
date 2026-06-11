import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import { IFindItemByIdRepository } from '@modules/content/domain/interfaces/content.repository.interface';
import { LearningItemMapper } from '@modules/content/domain/mappers/learning-item.mapper';

@Injectable()
export class FindItemByIdRepository implements IFindItemByIdRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findById(id: string): Promise<LearningItemEntity | null> {
    const item = await this.prisma.learningItem.findUnique({ where: { id } });
    return item ? LearningItemMapper.toEntity(item) : null;
  }
}
