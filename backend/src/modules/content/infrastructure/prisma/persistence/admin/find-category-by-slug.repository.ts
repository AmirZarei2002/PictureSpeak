import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import { IFindCategoryBySlugRepository } from '@modules/content/domain/interfaces/content.repository.interface';
import { CategoryMapper } from '@modules/content/domain/mappers/category.mapper';

@Injectable()
export class FindCategoryBySlugRepository implements IFindCategoryBySlugRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findBySlug(slug: string): Promise<CategoryEntity | null> {
    const category = await this.prisma.category.findUnique({
      where: { slug },
      include: { _count: { select: { items: true } } },
    });
    return category ? CategoryMapper.toEntity(category) : null;
  }
}
