import { Injectable } from '@nestjs/common';
import { IRecordProgressEventsRepository } from '@modules/progress/domain/interfaces/progress.repository.interface';
import { ProgressEventDto } from '../dtos/progress-event.dto';

@Injectable()
export class RecordProgressEventsUseCase {
  constructor(
    private readonly recordProgressEventsRepository: IRecordProgressEventsRepository,
  ) {}

  async execute(userId: string, events: ProgressEventDto[]): Promise<void> {
    const meaningful = events.filter((e) => e.views > 0 || e.listens > 0);
    if (meaningful.length === 0) return;
    await this.recordProgressEventsRepository.record(userId, meaningful);
  }
}
