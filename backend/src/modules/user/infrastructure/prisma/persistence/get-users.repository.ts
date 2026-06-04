import { Injectable } from '@nestjs/common';
import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { paginate } from '@common/utils/paginate.util';
import { Prisma, User } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { IFindUsersRepository } from '@modules/user/domain/interfaces/user.repository.interface';
import { UserMapper } from '@modules/user/domain/mappers/user.mapper';

@Injectable()
export class GetUsersRepository implements IFindUsersRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findAll(query: PaginationQueryDto) {
    const { sort = 'createdAt', order = 'desc' } = query;
    const orderByClause = { [sort]: order };

    return paginate<
      User,
      UserEntity,
      Prisma.UserFindManyArgs,
      Prisma.UserCountArgs
    >(
      this.prisma.user,
      query,
      (user) => UserMapper.toEntity(user),
      { include: { role: true } },
      orderByClause,
    );
  }
}
