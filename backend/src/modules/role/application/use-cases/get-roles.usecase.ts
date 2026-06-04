import { Injectable } from '@nestjs/common';
import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { RoleEntity } from '../../domain/entities/role.entity';
import { IFindRolesRepository } from '../../domain/interfaces/role.repository.interface';

@Injectable()
export class GetRolesUseCase {
  constructor(private readonly findRolesRepository: IFindRolesRepository) {}

  async execute(
    query: PaginationQueryDto,
  ): Promise<PaginatedResult<RoleEntity>> {
    return await this.findRolesRepository.findAll(query);
  }
}
