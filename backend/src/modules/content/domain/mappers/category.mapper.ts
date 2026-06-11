import { Category as PrismaCategory } from '@prisma/client';
import { CategoryEntity } from '../entities/category.entity';

type PrismaCategoryWithCount = PrismaCategory & {
  _count?: { items: number };
};

export class CategoryMapper {
  static toEntity(category: PrismaCategoryWithCount): CategoryEntity {
    return new CategoryEntity(
      category.id,
      category.slug,
      category.name,
      category.coverImagePath,
      category.colorHex,
      category.sortOrder,
      category.isActive,
      category._count?.items ?? 0,
    );
  }
}
