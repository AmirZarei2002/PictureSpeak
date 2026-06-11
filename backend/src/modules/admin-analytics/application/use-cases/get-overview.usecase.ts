import { Injectable } from '@nestjs/common';
import { AnalyticsOverviewEntity } from '@modules/admin-analytics/domain/entities/analytics-overview.entity';
import { IOverviewRepository } from '@modules/admin-analytics/domain/interfaces/analytics.repository.interface';

@Injectable()
export class GetOverviewUseCase {
  constructor(private readonly repository: IOverviewRepository) {}

  execute(): Promise<AnalyticsOverviewEntity> {
    return this.repository.getOverview();
  }
}
