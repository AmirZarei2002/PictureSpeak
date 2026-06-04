import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { IFindUserByIdRepository } from '@modules/user/domain/interfaces/user.repository.interface';
import { UserMapper } from '@modules/user/domain/mappers/user.mapper';

@Injectable()
export class GetUserByIdRepository implements IFindUserByIdRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findById(id: string): Promise<UserEntity | null> {
    const user = await this.prisma.user.findUnique({
      where: { id },
      include: { role: true },
    });
    return user ? UserMapper.toEntity(user) : null;
  }
}
