import { Role } from '@prisma/client';
import { UserEntity } from '@modules/user/domain/entities/user.entity';

export interface JwtPayload {
  sub: string;
  isGuest: boolean;
  role: Role;
}

export interface AuthResponse {
  user: UserEntity;
  accessToken: string;
}
