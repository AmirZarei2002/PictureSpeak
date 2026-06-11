import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { I18nContext } from 'nestjs-i18n';
import { PasswordService } from '@shared/services/password.service';
import {
  AuthResponse,
  JwtPayload,
} from '@modules/auth/domain/types/auth.types';
import { IFindUserByEmailRepository } from '@modules/user/domain/interfaces/user.repository.interface';
import { LoginDto } from '../dtos/login.dto';

@Injectable()
export class LoginUseCase {
  constructor(
    private readonly findUserByEmailRepository: IFindUserByEmailRepository,
    private readonly passwordService: PasswordService,
    private readonly jwtService: JwtService,
  ) {}

  async execute(data: LoginDto): Promise<AuthResponse> {
    const user = await this.findUserByEmailRepository.findByEmail(data.email);

    if (!user || !user.passwordHash) {
      throw new UnauthorizedException(
        I18nContext.current()?.t('auth.INVALID_CREDENTIALS'),
      );
    }

    const valid = await this.passwordService.comparePasswords(
      data.password,
      user.passwordHash,
    );

    if (!valid) {
      throw new UnauthorizedException(
        I18nContext.current()?.t('auth.INVALID_CREDENTIALS'),
      );
    }

    const payload: JwtPayload = {
      sub: user.id,
      isGuest: user.isGuest,
      role: user.role,
    };
    const accessToken = await this.jwtService.signAsync(payload);

    return { user, accessToken };
  }
}
