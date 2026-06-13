import { ActiveUsersEntity } from '../entities/active-users.entity';
import { AnalyticsOverviewEntity } from '../entities/analytics-overview.entity';
import { TopItemEntity } from '../entities/top-item.entity';

export interface IOverviewRepository {
  getOverview(): Promise<AnalyticsOverviewEntity>;
}

export interface ITopItemsRepository {
  getTopItems(limit: number, days?: number): Promise<TopItemEntity[]>;
}

export interface IActiveUsersRepository {
  getActiveUsers(windowDays: number): Promise<ActiveUsersEntity>;
}
