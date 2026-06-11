import { Injectable, NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { AdminUserDetailEntity } from '@modules/admin-user/domain/entities/admin-user-detail.entity';
import { IGetUserDetailRepository } from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';

@Injectable()
export class GetUserDetailUseCase {
  constructor(
    private readonly getUserDetailRepository: IGetUserDetailRepository,
  ) {}

  async execute(id: string): Promise<AdminUserDetailEntity> {
    const user = await this.getUserDetailRepository.getById(id);
    if (!user) {
      throw new NotFoundException(
        I18nContext.current()?.t('user.USER_NOT_FOUND') ?? 'User not found',
      );
    }
    return user;
  }
}
