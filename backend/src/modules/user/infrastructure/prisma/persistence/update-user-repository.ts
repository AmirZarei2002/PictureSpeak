import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { UpdateUserDto } from '@modules/user/application/dto/update-user.dto';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { IUpdateUserRepository } from '@modules/user/domain/interfaces/user.repository.interface';
import { UserMapper } from '@modules/user/domain/mappers/user.mapper';

@Injectable()
export class UpdateUserRepository implements IUpdateUserRepository {
  constructor(private readonly prisma: PrismaService) {}

  async update(id: string, data: UpdateUserDto): Promise<UserEntity | null> {
    const user = await this.prisma.user.update({ where: { id }, data });
    return UserMapper.toEntity(user);
  }
}
