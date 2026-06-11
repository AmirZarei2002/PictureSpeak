import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import { IFindCategoriesRepository } from '@modules/content/domain/interfaces/content.repository.interface';
import { CategoryMapper } from '@modules/content/domain/mappers/category.mapper';

@Injectable()
export class GetCategoriesRepository implements IFindCategoriesRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findAll(): Promise<CategoryEntity[]> {
    const categories = await this.prisma.category.findMany({
      where: { isActive: true },
      orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
      include: {
        _count: {
          select: { items: { where: { isActive: true } } },
        },
      },
    });

    return categories.map((c) => CategoryMapper.toEntity(c));
  }
}
