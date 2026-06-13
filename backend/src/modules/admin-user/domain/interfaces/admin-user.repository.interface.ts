import { PaginatedResult } from '@common/types/paginated-result.type';
import { Role } from '@prisma/client';
import { AdminUserDetailEntity } from '../entities/admin-user-detail.entity';
import { AdminUserListItemEntity } from '../entities/admin-user-list-item.entity';
import { UserProgressRowEntity } from '../entities/user-progress-row.entity';

export interface ListUsersFilters {
  page?: number;
  size?: number;
  search?: string;
  role?: Role;
  isGuest?: boolean;
}

export interface IListUsersRepository {
  list(
    filters: ListUsersFilters,
  ): Promise<PaginatedResult<AdminUserListItemEntity>>;
}

export interface IGetUserDetailRepository {
  getById(id: string): Promise<AdminUserDetailEntity | null>;
}

export interface IDeleteUserRepository {
  delete(id: string): Promise<boolean>;
}

export interface ICountAdminsRepository {
  count(): Promise<number>;
}

export interface IListUserProgressRepository {
  list(
    userId: string,
    page: number,
    size: number,
  ): Promise<PaginatedResult<UserProgressRowEntity>>;
}
