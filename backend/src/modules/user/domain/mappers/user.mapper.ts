import { User as PrismaUser } from '@prisma/client';
import { UserEntity } from '../entities/user.entity';

export class UserMapper {
  static toEntity(user: PrismaUser): UserEntity {
    return new UserEntity(
      user.id,
      user.email,
      user.isGuest,
      user.displayName,
      user.role,
      user.textScale,
      user.themeMode,
      Number(user.speechRate),
      user.soundEffectsOn,
      user.createdAt,
      user.updatedAt,
      user.passwordHash,
    );
  }
}
