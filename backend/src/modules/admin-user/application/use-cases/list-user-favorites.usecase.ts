import { Injectable, NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { PaginatedResult } from '@common/types/paginated-result.type';
import { IListUserFavoritesRepository } from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';
import { FavoriteItemEntity } from '@modules/favorites/domain/entities/favorite-item.entity';
import { IFindUserByIdRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class ListUserFavoritesUseCase {
  constructor(
    private readonly findUserByIdRepository: IFindUserByIdRepository,
    private readonly listUserFavoritesRepository: IListUserFavoritesRepository,
  ) {}

  async execute(
    userId: string,
    page: number,
    size: number,
  ): Promise<PaginatedResult<FavoriteItemEntity>> {
    const user = await this.findUserByIdRepository.findById(userId);
    if (!user) {
      throw new NotFoundException(
        I18nContext.current()?.t('user.USER_NOT_FOUND') ?? 'User not found',
      );
    }
    return this.listUserFavoritesRepository.list(userId, page, size);
  }
}
