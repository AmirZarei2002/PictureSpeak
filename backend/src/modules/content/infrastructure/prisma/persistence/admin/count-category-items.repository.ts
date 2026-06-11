import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { ICountCategoryItemsRepository } from '@modules/content/domain/interfaces/content.repository.interface';

@Injectable()
export class CountCategoryItemsRepository implements ICountCategoryItemsRepository {
  constructor(private readonly prisma: PrismaService) {}

  count(categoryId: string): Promise<number> {
    return this.prisma.learningItem.count({ where: { categoryId } });
  }
}
