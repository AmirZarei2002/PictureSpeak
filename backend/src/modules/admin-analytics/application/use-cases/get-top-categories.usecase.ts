import { Injectable } from '@nestjs/common';
import { TopCategoryEntity } from '@modules/admin-analytics/domain/entities/top-category.entity';
import { ITopCategoriesRepository } from '@modules/admin-analytics/domain/interfaces/analytics.repository.interface';
import { TopQueryDto } from '../dtos/top-query.dto';

@Injectable()
export class GetTopCategoriesUseCase {
  constructor(private readonly repository: ITopCategoriesRepository) {}

  execute(query: TopQueryDto): Promise<TopCategoryEntity[]> {
    return this.repository.getTopCategories(query.limit ?? 10);
  }
}
