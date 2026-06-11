import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import { IListAllCategoriesRepository } from '@modules/content/domain/interfaces/content.repository.interface';
import { CategoryMapper } from '@modules/content/domain/mappers/category.mapper';

@Injectable()
export class ListAllCategoriesRepository implements IListAllCategoriesRepository {
  constructor(private readonly prisma: PrismaService) {}

  async listAll(): Promise<CategoryEntity[]> {
    const categories = await this.prisma.category.findMany({
      orderBy: [{ sortOrder: 'asc' }, { name: 'asc' }],
      include: { _count: { select: { items: true } } },
    });
    return categories.map((c) => CategoryMapper.toEntity(c));
  }
}
