import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import {
  CreateCategoryData,
  ICreateCategoryRepository,
} from '@modules/content/domain/interfaces/content.repository.interface';
import { CategoryMapper } from '@modules/content/domain/mappers/category.mapper';

@Injectable()
export class CreateCategoryRepository implements ICreateCategoryRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateCategoryData): Promise<CategoryEntity> {
    const category = await this.prisma.category.create({
      data: {
        slug: data.slug,
        name: data.name,
        coverImagePath: data.coverImagePath,
        ...(data.colorHex !== undefined && { colorHex: data.colorHex }),
        ...(data.sortOrder !== undefined && { sortOrder: data.sortOrder }),
        ...(data.isActive !== undefined && { isActive: data.isActive }),
      },
      include: { _count: { select: { items: true } } },
    });
    return CategoryMapper.toEntity(category);
  }
}
