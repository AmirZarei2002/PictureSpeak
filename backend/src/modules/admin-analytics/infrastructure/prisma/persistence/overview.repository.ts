import { Injectable } from '@nestjs/common';
import { Role } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { AnalyticsOverviewEntity } from '@modules/admin-analytics/domain/entities/analytics-overview.entity';
import { IOverviewRepository } from '@modules/admin-analytics/domain/interfaces/analytics.repository.interface';

@Injectable()
export class OverviewRepository implements IOverviewRepository {
  constructor(private readonly prisma: PrismaService) {}

  async getOverview(): Promise<AnalyticsOverviewEntity> {
    const [
      totalUsers,
      guestUsers,
      totalAdmins,
      totalCategories,
      activeCategories,
      totalItems,
      activeItems,
      totalProgressRows,
    ] = await Promise.all([
      this.prisma.user.count(),
      this.prisma.user.count({ where: { isGuest: true } }),
      this.prisma.user.count({ where: { role: Role.ADMIN } }),
      this.prisma.category.count(),
      this.prisma.category.count({ where: { isActive: true } }),
      this.prisma.learningItem.count(),
      this.prisma.learningItem.count({ where: { isActive: true } }),
      this.prisma.progress.count(),
    ]);

    return new AnalyticsOverviewEntity(
      totalUsers,
      guestUsers,
      totalUsers - guestUsers,
      totalAdmins,
      totalCategories,
      activeCategories,
      totalItems,
      activeItems,
      totalProgressRows,
    );
  }
}
