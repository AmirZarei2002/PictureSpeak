import { Injectable } from '@nestjs/common';
import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { IFindUsersRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class GetUsersUseCase {
  constructor(private readonly findUsersRepository: IFindUsersRepository) {}

  async execute(
    query: PaginationQueryDto,
  ): Promise<PaginatedResult<UserEntity>> {
    return await this.findUsersRepository.findAll(query);
  }
}
