import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import {
  CreateUserData,
  ICreateUserRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';
import { UserMapper } from '@modules/user/domain/mappers/user.mapper';

@Injectable()
export class CreateUserRepository implements ICreateUserRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateUserData): Promise<UserEntity> {
    const user = await this.prisma.user.create({
      data: {
        email: data.email ?? null,
        passwordHash: data.passwordHash ?? null,
        isGuest: data.isGuest,
        displayName: data.displayName ?? null,
        ...(data.role !== undefined && { role: data.role }),
      },
    });
    return UserMapper.toEntity(user);
  }
}
