import { User as PrismaUser } from '@prisma/client';
import { RoleEntity } from '@modules/role/domain/entities/role.entity';
import { UserEntity } from '../entities/user.entity';

export class UserMapper {
  static toEntity(user: PrismaUser & { role?: RoleEntity }): UserEntity {
    return new UserEntity(
      user.id,
      user.role?.id || '',
      user.email || '',
      user.password,
      user.name || '',
      user.createdAt,
      user.updatedAt,
    );
  }
}
