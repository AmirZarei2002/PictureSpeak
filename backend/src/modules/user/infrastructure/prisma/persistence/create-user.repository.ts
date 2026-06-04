import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { CreateUserDto } from '@modules/user/application/dto/create-user.dto';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { ICreateUserRepository } from '@modules/user/domain/interfaces/user.repository.interface';
import { UserMapper } from '@modules/user/domain/mappers/user.mapper';
import { getDefaultRoleId } from '@utils/get-default-role-id';

@Injectable()
export class CreateUserRepository implements ICreateUserRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateUserDto): Promise<UserEntity> {
    const { roleId, ...userData } = data;

    const finalRoleId = roleId ?? (await getDefaultRoleId(this.prisma));

    const user = await this.prisma.user.create({
      data: {
        ...userData,
        role: { connect: { id: finalRoleId } },
      },
    });

    return UserMapper.toEntity(user);
  }
}
