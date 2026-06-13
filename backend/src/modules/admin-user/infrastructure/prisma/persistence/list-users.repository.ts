import { Injectable } from '@nestjs/common';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { Prisma } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { AdminUserListItemEntity } from '@modules/admin-user/domain/entities/admin-user-list-item.entity';
import {
  IListUsersRepository,
  ListUsersFilters,
} from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';

@Injectable()
export class ListUsersRepository implements IListUsersRepository {
  constructor(private readonly prisma: PrismaService) {}

  async list(
    filters: ListUsersFilters,
  ): Promise<PaginatedResult<AdminUserListItemEntity>> {
    const page = filters.page ?? 1;
    const size = filters.size ?? 20;
    const skip = (page - 1) * size;

    const where: Prisma.UserWhereInput = {};
    if (filters.role !== undefined) where.role = filters.role;
    if (filters.isGuest !== undefined) where.isGuest = filters.isGuest;
    if (filters.search) {
      where.OR = [
        { email: { contains: filters.search, mode: 'insensitive' } },
        { displayName: { contains: filters.search, mode: 'insensitive' } },
      ];
    }

    const [total, rows] = await Promise.all([
      this.prisma.user.count({ where }),
      this.prisma.user.findMany({
        where,
        skip,
        take: size,
        orderBy: { createdAt: 'desc' },
        select: {
          id: true,
          email: true,
          displayName: true,
          role: true,
          isGuest: true,
          createdAt: true,
          _count: { select: { progress: true } },
          progress: {
            select: { lastSeenAt: true },
            orderBy: { lastSeenAt: 'desc' },
            take: 1,
          },
        },
      }),
    ]);

    const data = rows.map(
      (r) =>
        new AdminUserListItemEntity(
          r.id,
          r.email,
          r.displayName,
          r.role,
          r.isGuest,
          r.createdAt,
          r._count.progress,
          r.progress[0]?.lastSeenAt ?? null,
        ),
    );

    const lastPage = Math.ceil(total / size);
    return {
      data,
      meta: {
        total,
        page,
        size,
        lastPage,
        prevPage: page > 1 ? page - 1 : null,
        nextPage: page < lastPage ? page + 1 : null,
      },
    };
  }
}
