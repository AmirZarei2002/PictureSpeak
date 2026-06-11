import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { IFindUserByEmailRepository } from '@modules/user/domain/interfaces/user.repository.interface';
import { UserMapper } from '@modules/user/domain/mappers/user.mapper';

@Injectable()
export class GetUserByEmailRepository implements IFindUserByEmailRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findByEmail(email: string): Promise<UserEntity | null> {
    const user = await this.prisma.user.findUnique({ where: { email } });
    if (!user) return null;
    return UserMapper.toEntity(user);
  }
}
