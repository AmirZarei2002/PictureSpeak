import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { AssignRoleToUserDto } from '@modules/user/application/dto/assign-role-to-user.dto';
import { UserEntity } from '@modules/user/domain/entities/user.entity';

export interface ICreateUserRepository {
  create(user: Partial<UserEntity>): Promise<UserEntity>;
}

export interface IUpdateUserRepository {
  update(id: string, user: Partial<UserEntity>): Promise<UserEntity | null>;
}

export interface IFindUsersRepository {
  findAll(query: PaginationQueryDto): Promise<PaginatedResult<UserEntity>>;
}

export interface IFindUserByIdRepository {
  findById(id: string): Promise<UserEntity | null>;
}

export interface IFindUserByEmailRepository {
  findByEmail(email: string): Promise<UserEntity | null>;
}

export interface IDeleteUserRepository {
  delete(id: string): Promise<void>;
}

export interface IAssignRoleRepository {
  assignRole(userId: string, data: AssignRoleToUserDto): Promise<void>;
}

export interface IRevokeRoleRepository {
  revokeRole(userId: string): Promise<void>;
}

export interface IUserProvisionService {
  findOrCreateUser(email: string): Promise<UserEntity>;
}
