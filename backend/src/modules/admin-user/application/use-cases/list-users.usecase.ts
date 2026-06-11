import { Injectable } from '@nestjs/common';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { AdminUserListItemEntity } from '@modules/admin-user/domain/entities/admin-user-list-item.entity';
import { IListUsersRepository } from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';
import { ListUsersQueryDto } from '../dtos/list-users-query.dto';

@Injectable()
export class ListUsersUseCase {
  constructor(private readonly listUsersRepository: IListUsersRepository) {}

  execute(
    query: ListUsersQueryDto,
  ): Promise<PaginatedResult<AdminUserListItemEntity>> {
    return this.listUsersRepository.list({
      page: query.page,
      size: query.size,
      search: query.search,
      role: query.role,
      isGuest: query.isGuest,
    });
  }
}
