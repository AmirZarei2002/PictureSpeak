import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import {
  IRecordProgressEventsRepository,
  ProgressEventInput,
} from '@modules/progress/domain/interfaces/progress.repository.interface';

@Injectable()
export class RecordProgressEventsRepository implements IRecordProgressEventsRepository {
  constructor(private readonly prisma: PrismaService) {}

  async record(userId: string, events: ProgressEventInput[]): Promise<void> {
    const now = new Date();

    await this.prisma.$transaction(
      events.map((e) =>
        this.prisma.progress.upsert({
          where: { userId_itemId: { userId, itemId: e.itemId } },
          update: {
            viewCount: { increment: e.views },
            listenCount: { increment: e.listens },
            lastSeenAt: now,
          },
          create: {
            userId,
            itemId: e.itemId,
            viewCount: e.views,
            listenCount: e.listens,
            firstSeenAt: now,
            lastSeenAt: now,
          },
        }),
      ),
    );
  }
}
