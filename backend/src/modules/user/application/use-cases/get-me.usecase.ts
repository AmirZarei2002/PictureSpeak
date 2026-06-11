import { Injectable, NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { IFindUserByIdRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class GetMeUseCase {
  constructor(
    private readonly findUserByIdRepository: IFindUserByIdRepository,
  ) {}

  async execute(userId: string): Promise<UserEntity> {
    const user = await this.findUserByIdRepository.findById(userId);

    if (!user) {
      throw new NotFoundException(
        I18nContext.current()?.t('user.USER_NOT_FOUND'),
      );
    }

    return user;
  }
}
