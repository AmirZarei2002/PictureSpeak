import { Injectable } from '@nestjs/common';
import { ProgressSummaryEntity } from '@modules/progress/domain/entities/progress-summary.entity';
import { IGetProgressSummaryRepository } from '@modules/progress/domain/interfaces/progress.repository.interface';

@Injectable()
export class GetProgressSummaryUseCase {
  constructor(
    private readonly getProgressSummaryRepository: IGetProgressSummaryRepository,
  ) {}

  execute(userId: string): Promise<ProgressSummaryEntity> {
    return this.getProgressSummaryRepository.getSummary(userId);
  }
}
