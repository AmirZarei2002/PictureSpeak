import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import { IFindCategoryByIdRepository } from '@modules/content/domain/interfaces/content.repository.interface';
import { CategoryMapper } from '@modules/content/domain/mappers/category.mapper';

@Injectable()
export class FindCategoryByIdRepository implements IFindCategoryByIdRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findById(id: string): Promise<CategoryEntity | null> {
    const category = await this.prisma.category.findUnique({
      where: { id },
      include: { _count: { select: { items: true } } },
    });
    return category ? CategoryMapper.toEntity(category) : null;
  }
}
