import { Injectable } from '@nestjs/common';
import { TopItemEntity } from '@modules/admin-analytics/domain/entities/top-item.entity';
import { ITopItemsRepository } from '@modules/admin-analytics/domain/interfaces/analytics.repository.interface';
import { TopQueryDto } from '../dtos/top-query.dto';

@Injectable()
export class GetTopItemsUseCase {
  constructor(private readonly repository: ITopItemsRepository) {}

  execute(query: TopQueryDto): Promise<TopItemEntity[]> {
    return this.repository.getTopItems(query.limit ?? 10, query.days);
  }
}
