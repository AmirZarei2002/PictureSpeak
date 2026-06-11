import { Injectable, NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { UserProgressRowEntity } from '@modules/admin-user/domain/entities/user-progress-row.entity';
import { IListUserProgressRepository } from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';
import { IFindUserByIdRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class ListUserProgressUseCase {
  constructor(
    private readonly findUserByIdRepository: IFindUserByIdRepository,
    private readonly listUserProgressRepository: IListUserProgressRepository,
  ) {}

  async execute(
    userId: string,
    page: number,
    size: number,
  ): Promise<PaginatedResult<UserProgressRowEntity>> {
    const user = await this.findUserByIdRepository.findById(userId);
    if (!user) {
      throw new NotFoundException(
        I18nContext.current()?.t('user.USER_NOT_FOUND') ?? 'User not found',
      );
    }
    return this.listUserProgressRepository.list(userId, page, size);
  }
}
