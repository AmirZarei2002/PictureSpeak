import { Injectable, NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import {
  IFindUserByIdRepository,
  IUpdateUserRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';
import { UpdatePreferencesDto } from '../dtos/update-preferences.dto';

@Injectable()
export class UpdateMeUseCase {
  constructor(
    private readonly updateUserRepository: IUpdateUserRepository,
    private readonly findUserByIdRepository: IFindUserByIdRepository,
  ) {}

  async execute(
    userId: string,
    data: UpdatePreferencesDto,
  ): Promise<UserEntity> {
    const i18n = I18nContext.current();
    const existing = await this.findUserByIdRepository.findById(userId);

    if (!existing) {
      throw new NotFoundException(i18n?.t('user.USER_NOT_FOUND'));
    }

    const user = await this.updateUserRepository.update(userId, data);

    if (!user) {
      throw new NotFoundException(i18n?.t('user.USER_NOT_FOUND'));
    }

    return user;
  }
}
