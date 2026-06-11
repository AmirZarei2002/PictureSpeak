import { Injectable } from '@nestjs/common';
import { IRemoveFavoriteRepository } from '@modules/favorites/domain/interfaces/favorites.repository.interface';

@Injectable()
export class RemoveFavoriteUseCase {
  constructor(
    private readonly removeFavoriteRepository: IRemoveFavoriteRepository,
  ) {}

  execute(userId: string, itemId: string): Promise<void> {
    return this.removeFavoriteRepository.remove(userId, itemId);
  }
}
