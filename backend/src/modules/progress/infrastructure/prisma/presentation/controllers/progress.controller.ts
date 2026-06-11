import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  ParseArrayPipe,
  Post,
  UseGuards,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBody,
  ApiNoContentResponse,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import {
  AuthenticatedUser,
  CurrentUser,
} from '@common/decorators/current-user.decorator';
import { JwtAuthGuard } from '@common/guards/jwt-auth.guard';
import { ProgressEventDto } from '@modules/progress/application/dtos/progress-event.dto';
import { GetProgressSummaryUseCase } from '@modules/progress/application/use-cases/get-progress-summary.usecase';
import { RecordProgressEventsUseCase } from '@modules/progress/application/use-cases/record-progress-events.usecase';
import { BEARER_AUTH_NAME, TAGS } from '@docs/constants';
import { ApiStandardErrors } from '@docs/decorators/api-standard-errors.decorator';
import { ProgressSummaryResponse } from '@docs/schemas/progress-response.schema';

@ApiTags(TAGS.Progress)
@ApiBearerAuth(BEARER_AUTH_NAME)
@Controller('progress')
@UseGuards(JwtAuthGuard)
export class ProgressController {
  constructor(
    private readonly recordProgressEventsUseCase: RecordProgressEventsUseCase,
    private readonly getProgressSummaryUseCase: GetProgressSummaryUseCase,
  ) {}

  @Post('events')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiOperation({
    summary: 'Record a batch of progress events',
    description:
      'Accepts an array of `ProgressEventDto`. Each entry increments the cumulative view/listen counters for one learning item. Clients should buffer events locally and flush in batches to stay well under the 10 req/min rate limit. The endpoint is upsert-safe: events for items the user has never seen create the underlying progress row.',
  })
  @ApiBody({
    type: [ProgressEventDto],
    description: 'Array of per-item interaction deltas to apply.',
    examples: {
      singleSession: {
        summary: 'A short learning session',
        value: [
          {
            itemId: 'd1f8c2a0-3b45-4f6e-8a9b-0c1d2e3f4a5b',
            views: 3,
            listens: 2,
          },
          {
            itemId: 'a7b3c4d5-6e7f-4889-9a0b-1c2d3e4f5a6b',
            views: 1,
            listens: 1,
          },
        ],
      },
      empty: {
        summary: 'Empty flush (no-op)',
        value: [],
      },
    },
  })
  @ApiNoContentResponse({
    description: 'Events accepted and counters updated.',
  })
  @ApiStandardErrors({ validation: true, unauthorized: true })
  recordEvents(
    @CurrentUser() user: AuthenticatedUser,
    @Body(new ParseArrayPipe({ items: ProgressEventDto, whitelist: true }))
    events: ProgressEventDto[],
  ) {
    return this.recordProgressEventsUseCase.execute(user.id, events);
  }

  @Get('summary')
  @ApiOperation({
    summary: 'Get aggregated progress for the current user',
    description:
      'Returns lifetime totals (views, listens, distinct items explored) plus a per-category breakdown suitable for rendering progress bars. Computed on demand from the `progress` table; no caching.',
  })
  @ApiOkResponse({
    description: 'Aggregated progress summary.',
    type: ProgressSummaryResponse,
  })
  @ApiStandardErrors({ unauthorized: true })
  getSummary(@CurrentUser() user: AuthenticatedUser) {
    return this.getProgressSummaryUseCase.execute(user.id);
  }
}
