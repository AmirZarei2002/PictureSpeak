import { FavoriteItemEntity } from '@modules/favorites/domain/entities/favorite-item.entity';

export interface IFindFavoritesRepository {
  findAllForUser(userId: string): Promise<FavoriteItemEntity[]>;
}

export interface IAddFavoriteRepository {
  add(userId: string, itemId: string): Promise<void>;
}

export interface IRemoveFavoriteRepository {
  remove(userId: string, itemId: string): Promise<void>;
}

export interface ILearningItemExistsRepository {
  exists(itemId: string): Promise<boolean>;
}
