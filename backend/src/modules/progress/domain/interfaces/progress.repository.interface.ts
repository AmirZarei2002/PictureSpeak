import { ProgressSummaryEntity } from '@modules/progress/domain/entities/progress-summary.entity';

export interface ProgressEventInput {
  itemId: string;
  views: number;
  listens: number;
}

export interface IRecordProgressEventsRepository {
  record(userId: string, events: ProgressEventInput[]): Promise<void>;
}

export interface IGetProgressSummaryRepository {
  getSummary(userId: string): Promise<ProgressSummaryEntity>;
}
