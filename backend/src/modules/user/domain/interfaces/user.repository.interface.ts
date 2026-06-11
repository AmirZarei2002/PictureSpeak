import { Role, TextScale, ThemeMode } from '@prisma/client';
import { UserEntity } from '@modules/user/domain/entities/user.entity';

export interface CreateUserData {
  email?: string | null;
  passwordHash?: string | null;
  isGuest: boolean;
  displayName?: string | null;
  role?: Role;
}

export interface UpdateUserData {
  email?: string | null;
  passwordHash?: string | null;
  isGuest?: boolean;
  displayName?: string | null;
  role?: Role;
  textScale?: TextScale;
  themeMode?: ThemeMode;
  speechRate?: number;
  soundEffectsOn?: boolean;
}

export interface ICreateUserRepository {
  create(data: CreateUserData): Promise<UserEntity>;
}

export interface IUpdateUserRepository {
  update(id: string, data: UpdateUserData): Promise<UserEntity | null>;
}

export interface IFindUserByIdRepository {
  findById(id: string): Promise<UserEntity | null>;
}

export interface IFindUserByEmailRepository {
  findByEmail(email: string): Promise<UserEntity | null>;
}
