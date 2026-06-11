import { Injectable } from '@nestjs/common';
import { FavoriteItemEntity } from '@modules/favorites/domain/entities/favorite-item.entity';
import { IFindFavoritesRepository } from '@modules/favorites/domain/interfaces/favorites.repository.interface';

@Injectable()
export class GetFavoritesUseCase {
  constructor(
    private readonly findFavoritesRepository: IFindFavoritesRepository,
  ) {}

  execute(userId: string): Promise<FavoriteItemEntity[]> {
    return this.findFavoritesRepository.findAllForUser(userId);
  }
}
