import { Injectable, NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import {
  IAddFavoriteRepository,
  ILearningItemExistsRepository,
} from '@modules/favorites/domain/interfaces/favorites.repository.interface';

@Injectable()
export class AddFavoriteUseCase {
  constructor(
    private readonly addFavoriteRepository: IAddFavoriteRepository,
    private readonly learningItemExistsRepository: ILearningItemExistsRepository,
  ) {}

  async execute(userId: string, itemId: string): Promise<void> {
    const exists = await this.learningItemExistsRepository.exists(itemId);

    if (!exists) {
      throw new NotFoundException(
        I18nContext.current()?.t('favorites.ITEM_NOT_FOUND', {
          args: { itemId },
        }),
      );
    }

    await this.addFavoriteRepository.add(userId, itemId);
  }
}
