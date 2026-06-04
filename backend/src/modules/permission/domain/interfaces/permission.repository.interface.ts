import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { PermissionEntity } from '../entities/permission.entity';

export interface ICreatePermissionRepository {
  create(data: { name: string; roleIds?: string[] }): Promise<PermissionEntity>;
}

export interface IUpdatePermissionRepository {
  update(
    id: string,
    data: Partial<PermissionEntity>,
  ): Promise<PermissionEntity | null>;
}

export interface IFindPermissionsRepository {
  findAll(
    query: PaginationQueryDto,
  ): Promise<PaginatedResult<PermissionEntity>>;
}

export interface IFindPermissionByIdRepository {
  findOne(id: string): Promise<PermissionEntity | null>;
}

export interface IDeletePermissionRepository {
  delete(id: string): Promise<void>;
}
