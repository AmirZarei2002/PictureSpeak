import { Injectable } from '@nestjs/common';
import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { paginate } from '@common/utils/paginate.util';
import { Permission, Prisma } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import { IFindPermissionsRepository } from '@modules/permission/domain/interfaces/permission.repository.interface';
import { PermissionMapper } from '@modules/permission/domain/mappers/permission.mapper';

@Injectable()
export class GetPermissionsRepository implements IFindPermissionsRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findAll(query: PaginationQueryDto) {
    const { sort = 'createdAt', order = 'desc' } = query;
    const orderByClause = { [sort]: order };

    return paginate<
      Permission,
      PermissionEntity,
      Prisma.PermissionFindManyArgs,
      Prisma.PermissionCountArgs
    >(
      this.prisma.permission,
      query,
      (permission) => PermissionMapper.toEntity(permission),
      {},
      orderByClause,
    );
  }
}
