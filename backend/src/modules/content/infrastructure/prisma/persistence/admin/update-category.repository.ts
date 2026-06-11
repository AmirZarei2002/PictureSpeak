import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import {
  IUpdateCategoryRepository,
  UpdateCategoryData,
} from '@modules/content/domain/interfaces/content.repository.interface';
import { CategoryMapper } from '@modules/content/domain/mappers/category.mapper';

@Injectable()
export class UpdateCategoryRepository implements IUpdateCategoryRepository {
  constructor(private readonly prisma: PrismaService) {}

  async update(
    id: string,
    data: UpdateCategoryData,
  ): Promise<CategoryEntity | null> {
    try {
      const category = await this.prisma.category.update({
        where: { id },
        data,
        include: { _count: { select: { items: true } } },
      });
      return CategoryMapper.toEntity(category);
    } catch (error) {
      if (
        error instanceof Prisma.PrismaClientKnownRequestError &&
        error.code === 'P2025'
      ) {
        return null;
      }
      throw error;
    }
  }
}
