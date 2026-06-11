import { Controller, Get, Query, UseGuards } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { AdminGuard } from '@common/guards/admin.guard';
import { JwtAuthGuard } from '@common/guards/jwt-auth.guard';
import { ActiveUsersQueryDto } from '@modules/admin-analytics/application/dtos/active-users-query.dto';
import { TopQueryDto } from '@modules/admin-analytics/application/dtos/top-query.dto';
import { GetActiveUsersUseCase } from '@modules/admin-analytics/application/use-cases/get-active-users.usecase';
import { GetOverviewUseCase } from '@modules/admin-analytics/application/use-cases/get-overview.usecase';
import { GetTopCategoriesUseCase } from '@modules/admin-analytics/application/use-cases/get-top-categories.usecase';
import { GetTopItemsUseCase } from '@modules/admin-analytics/application/use-cases/get-top-items.usecase';
import { BEARER_AUTH_NAME, TAGS } from '@docs/constants';
import { ApiStandardErrors } from '@docs/decorators/api-standard-errors.decorator';
import {
  ActiveUsersResponse,
  AnalyticsOverviewResponse,
  TopCategoryResponse,
  TopItemResponse,
} from '@docs/schemas/admin-response.schema';

@ApiTags(TAGS.AdminAnalytics)
@ApiBearerAuth(BEARER_AUTH_NAME)
@Controller('admin/analytics')
@UseGuards(JwtAuthGuard, AdminGuard)
export class AdminAnalyticsController {
  constructor(
    private readonly getOverviewUseCase: GetOverviewUseCase,
    private readonly getTopItemsUseCase: GetTopItemsUseCase,
    private readonly getTopCategoriesUseCase: GetTopCategoriesUseCase,
    private readonly getActiveUsersUseCase: GetActiveUsersUseCase,
  ) {}

  @Get('overview')
  @ApiOperation({ summary: 'Platform totals (users, content, engagement)' })
  @ApiOkResponse({
    description: 'Aggregate counts across users, content, and engagement.',
    type: AnalyticsOverviewResponse,
  })
  @ApiStandardErrors({ unauthorized: true, forbidden: true })
  overview() {
    return this.getOverviewUseCase.execute();
  }

  @Get('top-items')
  @ApiOperation({
    summary: 'Top items by total views (with listens shown alongside)',
    description:
      'Optional `days` filter restricts the window via `Progress.lastSeenAt`. ' +
      '`limit` defaults to 10, max 50.',
  })
  @ApiOkResponse({
    description: 'Ranked items, descending by total views.',
    type: [TopItemResponse],
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
  })
  topItems(@Query() query: TopQueryDto) {
    return this.getTopItemsUseCase.execute(query);
  }

  @Get('top-categories')
  @ApiOperation({ summary: 'Top categories by favorite count' })
  @ApiOkResponse({
    description: 'Ranked categories, descending by favorite count.',
    type: [TopCategoryResponse],
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
  })
  topCategories(@Query() query: TopQueryDto) {
    return this.getTopCategoriesUseCase.execute(query);
  }

  @Get('active-users')
  @ApiOperation({
    summary: 'DAU / WAU / MAU plus a daily series for the window',
    description:
      'Distinct users with at least one Progress event in the given window. ' +
      '`days` defaults to 30 (max 365). Missing days in the series are zero-filled.',
  })
  @ApiOkResponse({
    description: 'Active-user totals plus per-day series.',
    type: ActiveUsersResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
  })
  activeUsers(@Query() query: ActiveUsersQueryDto) {
    return this.getActiveUsersUseCase.execute(query);
  }
}
