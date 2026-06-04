import { Injectable } from '@nestjs/common';
import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import { IFindPermissionsRepository } from '@modules/permission/domain/interfaces/permission.repository.interface';

@Injectable()
export class GetPermissionsUseCase {
  constructor(
    private readonly findPermissionsRepository: IFindPermissionsRepository,
  ) {}

  async execute(
    query: PaginationQueryDto,
  ): Promise<PaginatedResult<PermissionEntity>> {
    return await this.findPermissionsRepository.findAll(query);
  }
}
