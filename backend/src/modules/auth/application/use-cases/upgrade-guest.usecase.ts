import {
  BadRequestException,
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { I18nContext } from 'nestjs-i18n';
import { PasswordService } from '@shared/services/password.service';
import {
  AuthResponse,
  JwtPayload,
} from '@modules/auth/domain/types/auth.types';
import {
  IFindUserByEmailRepository,
  IFindUserByIdRepository,
  IUpdateUserRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';
import { UpgradeGuestDto } from '../dtos/upgrade-guest.dto';

@Injectable()
export class UpgradeGuestUseCase {
  constructor(
    private readonly findUserByIdRepository: IFindUserByIdRepository,
    private readonly findUserByEmailRepository: IFindUserByEmailRepository,
    private readonly updateUserRepository: IUpdateUserRepository,
    private readonly passwordService: PasswordService,
    private readonly jwtService: JwtService,
  ) {}

  async execute(userId: string, data: UpgradeGuestDto): Promise<AuthResponse> {
    const i18n = I18nContext.current();
    const current = await this.findUserByIdRepository.findById(userId);

    if (!current) {
      throw new NotFoundException(i18n?.t('auth.USER_NOT_FOUND'));
    }

    if (!current.isGuest) {
      throw new BadRequestException(i18n?.t('auth.ACCOUNT_ALREADY_UPGRADED'));
    }

    const emailTaken = await this.findUserByEmailRepository.findByEmail(
      data.email,
    );

    if (emailTaken) {
      throw new ConflictException(i18n?.t('auth.EMAIL_ALREADY_IN_USE'));
    }

    const passwordHash = await this.passwordService.hashPassword(data.password);

    const user = await this.updateUserRepository.update(userId, {
      email: data.email,
      passwordHash,
      isGuest: false,
      displayName: data.displayName ?? current.displayName,
    });

    if (!user) {
      throw new NotFoundException(i18n?.t('auth.USER_NOT_FOUND'));
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
