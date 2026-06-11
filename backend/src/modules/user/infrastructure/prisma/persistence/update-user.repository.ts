import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import {
  IUpdateUserRepository,
  UpdateUserData,
} from '@modules/user/domain/interfaces/user.repository.interface';
import { UserMapper } from '@modules/user/domain/mappers/user.mapper';

@Injectable()
export class UpdateUserRepository implements IUpdateUserRepository {
  constructor(private readonly prisma: PrismaService) {}

  async update(id: string, data: UpdateUserData): Promise<UserEntity | null> {
    try {
      const user = await this.prisma.user.update({
        where: { id },
        data,
      });
      return UserMapper.toEntity(user);
    } catch (error) {
      if (
        error instanceof Prisma.PrismaClientKnownRequestError &&
        error.code === 'P2025'
      ) {
        return null;
      }
      throw error;
    }
  }
}
