import { Module } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { GetProgressSummaryUseCase } from './application/use-cases/get-progress-summary.usecase';
import { RecordProgressEventsUseCase } from './application/use-cases/record-progress-events.usecase';
import {
  IGetProgressSummaryRepository,
  IRecordProgressEventsRepository,
} from './domain/interfaces/progress.repository.interface';
import { GetProgressSummaryRepository } from './infrastructure/prisma/persistence/get-progress-summary.repository';
import { RecordProgressEventsRepository } from './infrastructure/prisma/persistence/record-progress-events.repository';
import { ProgressController } from './infrastructure/prisma/presentation/controllers/progress.controller';

@Module({
  controllers: [ProgressController],
  providers: [
    PrismaService,

    RecordProgressEventsRepository,
    GetProgressSummaryRepository,

    {
      provide: RecordProgressEventsUseCase,
      useFactory: (repo: IRecordProgressEventsRepository) =>
        new RecordProgressEventsUseCase(repo),
      inject: [RecordProgressEventsRepository],
    },
    {
      provide: GetProgressSummaryUseCase,
      useFactory: (repo: IGetProgressSummaryRepository) =>
        new GetProgressSummaryUseCase(repo),
      inject: [GetProgressSummaryRepository],
    },
  ],
})
export class ProgressModule {}
