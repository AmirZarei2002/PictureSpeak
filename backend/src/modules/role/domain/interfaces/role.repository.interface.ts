import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { AssignPermissionsToRoleDto } from '../../application/dto/assign-permissions-to-role.dto';
import { RevokePermissionsFromRoleDto } from '../../application/dto/revoke-permissions-from-role.dto';
import { RoleEntity } from '../entities/role.entity';

export interface ICreateRoleRepository {
  create(data: { name: string; permissionIds?: string[] }): Promise<RoleEntity>;
}

export interface IUpdateRoleRepository {
  update(
    id: string,
    data: { name?: string; permissionIds?: string[] },
  ): Promise<RoleEntity | null>;
}

export interface IFindRolesRepository {
  findAll(query: PaginationQueryDto): Promise<PaginatedResult<RoleEntity>>;
}

export interface IFindRoleByIdRepository {
  findOne(id: string): Promise<RoleEntity | null>;
}

export interface IDeleteRoleRepository {
  delete(id: string): Promise<void>;
}

export interface IAssignPermissionsRepository {
  assignPermissions(
    roleId: string,
    data: AssignPermissionsToRoleDto,
  ): Promise<void>;
}

export interface IRevokePermissionsRepository {
  revokePermissions(
    roleId: string,
    data: RevokePermissionsFromRoleDto,
  ): Promise<void>;
}
