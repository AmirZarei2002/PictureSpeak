import { Injectable } from '@nestjs/common';
import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { paginate } from '@common/utils/paginate.util';
import { Prisma, Role } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { RoleEntity } from '@modules/role/domain/entities/role.entity';
import { IFindRolesRepository } from '@modules/role/domain/interfaces/role.repository.interface';
import { RoleMapper } from '@modules/role/domain/mappers/role.mapper';

@Injectable()
export class GetRolesRepository implements IFindRolesRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findAll(query: PaginationQueryDto) {
    const { sort = 'createdAt', order = 'desc' } = query;
    const orderByClause = { [sort]: order };

    return paginate<
      Role,
      RoleEntity,
      Prisma.RoleFindManyArgs,
      Prisma.RoleCountArgs
    >(
      this.prisma.role,
      query,
      (role) => RoleMapper.toEntity(role),
      {},
      orderByClause,
    );
  }
}
