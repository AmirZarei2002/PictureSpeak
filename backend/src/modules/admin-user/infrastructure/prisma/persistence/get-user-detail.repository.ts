import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { AdminUserDetailEntity } from '@modules/admin-user/domain/entities/admin-user-detail.entity';
import { IGetUserDetailRepository } from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';

@Injectable()
export class GetUserDetailRepository implements IGetUserDetailRepository {
  constructor(private readonly prisma: PrismaService) {}

  async getById(id: string): Promise<AdminUserDetailEntity | null> {
    const user = await this.prisma.user.findUnique({
      where: { id },
      select: {
        id: true,
        email: true,
        displayName: true,
        role: true,
        isGuest: true,
        textScale: true,
        themeMode: true,
        speechRate: true,
        soundEffectsOn: true,
        createdAt: true,
        updatedAt: true,
        _count: { select: { progress: true } },
        progress: {
          select: { lastSeenAt: true },
          orderBy: { lastSeenAt: 'desc' },
          take: 1,
        },
      },
    });

    if (!user) return null;

    return new AdminUserDetailEntity(
      user.id,
      user.email,
      user.displayName,
      user.role,
      user.isGuest,
      user.textScale,
      user.themeMode,
      Number(user.speechRate),
      user.soundEffectsOn,
      user.createdAt,
      user.updatedAt,
      user._count.progress,
      user.progress[0]?.lastSeenAt ?? null,
    );
  }
}
