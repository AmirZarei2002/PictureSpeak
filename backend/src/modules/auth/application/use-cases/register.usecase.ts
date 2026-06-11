import { ConflictException, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { I18nContext } from 'nestjs-i18n';
import { PasswordService } from '@shared/services/password.service';
import {
  AuthResponse,
  JwtPayload,
} from '@modules/auth/domain/types/auth.types';
import {
  ICreateUserRepository,
  IFindUserByEmailRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';
import { RegisterDto } from '../dtos/register.dto';

@Injectable()
export class RegisterUseCase {
  constructor(
    private readonly findUserByEmailRepository: IFindUserByEmailRepository,
    private readonly createUserRepository: ICreateUserRepository,
    private readonly passwordService: PasswordService,
    private readonly jwtService: JwtService,
  ) {}

  async execute(data: RegisterDto): Promise<AuthResponse> {
    const existing = await this.findUserByEmailRepository.findByEmail(
      data.email,
    );

    if (existing) {
      throw new ConflictException(
        I18nContext.current()?.t('auth.EMAIL_ALREADY_IN_USE'),
      );
    }

    const passwordHash = await this.passwordService.hashPassword(data.password);

    const user = await this.createUserRepository.create({
      email: data.email,
      passwordHash,
      isGuest: false,
      displayName: data.displayName ?? null,
    });

    const payload: JwtPayload = {
      sub: user.id,
      isGuest: user.isGuest,
      role: user.role,
    };
    const accessToken = await this.jwtService.signAsync(payload);

    return { user, accessToken };
  }
}
