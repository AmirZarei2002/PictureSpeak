import { Module } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { GetActiveUsersUseCase } from './application/use-cases/get-active-users.usecase';
import { GetOverviewUseCase } from './application/use-cases/get-overview.usecase';
import { GetTopCategoriesUseCase } from './application/use-cases/get-top-categories.usecase';
import { GetTopItemsUseCase } from './application/use-cases/get-top-items.usecase';
import { ActiveUsersRepository } from './infrastructure/prisma/persistence/active-users.repository';
import { OverviewRepository } from './infrastructure/prisma/persistence/overview.repository';
import { TopCategoriesRepository } from './infrastructure/prisma/persistence/top-categories.repository';
import { TopItemsRepository } from './infrastructure/prisma/persistence/top-items.repository';
import { AdminAnalyticsController } from './infrastructure/prisma/presentation/controllers/admin-analytics.controller';

@Module({
  controllers: [AdminAnalyticsController],
  providers: [
    PrismaService,

    OverviewRepository,
    TopItemsRepository,
    TopCategoriesRepository,
    ActiveUsersRepository,

    {
      provide: GetOverviewUseCase,
      useFactory: (repo: OverviewRepository) => new GetOverviewUseCase(repo),
      inject: [OverviewRepository],
    },
    {
      provide: GetTopItemsUseCase,
      useFactory: (repo: TopItemsRepository) => new GetTopItemsUseCase(repo),
      inject: [TopItemsRepository],
    },
    {
      provide: GetTopCategoriesUseCase,
      useFactory: (repo: TopCategoriesRepository) =>
        new GetTopCategoriesUseCase(repo),
      inject: [TopCategoriesRepository],
    },
    {
      provide: GetActiveUsersUseCase,
      useFactory: (repo: ActiveUsersRepository) =>
        new GetActiveUsersUseCase(repo),
      inject: [ActiveUsersRepository],
    },
  ],
})
export class AdminAnalyticsModule {}
