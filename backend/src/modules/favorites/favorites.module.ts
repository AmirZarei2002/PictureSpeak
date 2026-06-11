import { Module } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { AddFavoriteUseCase } from './application/use-cases/add-favorite.usecase';
import { GetFavoritesUseCase } from './application/use-cases/get-favorites.usecase';
import { RemoveFavoriteUseCase } from './application/use-cases/remove-favorite.usecase';
import {
  IAddFavoriteRepository,
  IFindFavoritesRepository,
  ILearningItemExistsRepository,
  IRemoveFavoriteRepository,
} from './domain/interfaces/favorites.repository.interface';
import { AddFavoriteRepository } from './infrastructure/prisma/persistence/add-favorite.repository';
import { GetFavoritesRepository } from './infrastructure/prisma/persistence/get-favorites.repository';
import { LearningItemExistsRepository } from './infrastructure/prisma/persistence/learning-item-exists.repository';
import { RemoveFavoriteRepository } from './infrastructure/prisma/persistence/remove-favorite.repository';
import { FavoritesController } from './infrastructure/prisma/presentation/controllers/favorites.controller';

@Module({
  controllers: [FavoritesController],
  providers: [
    PrismaService,

    GetFavoritesRepository,
    AddFavoriteRepository,
    RemoveFavoriteRepository,
    LearningItemExistsRepository,

    {
      provide: GetFavoritesUseCase,
      useFactory: (repo: IFindFavoritesRepository) =>
        new GetFavoritesUseCase(repo),
      inject: [GetFavoritesRepository],
    },
    {
      provide: AddFavoriteUseCase,
      useFactory: (
        addRepo: IAddFavoriteRepository,
        existsRepo: ILearningItemExistsRepository,
      ) => new AddFavoriteUseCase(addRepo, existsRepo),
      inject: [AddFavoriteRepository, LearningItemExistsRepository],
    },
    {
      provide: RemoveFavoriteUseCase,
      useFactory: (repo: IRemoveFavoriteRepository) =>
        new RemoveFavoriteUseCase(repo),
      inject: [RemoveFavoriteRepository],
    },
  ],
})
export class FavoritesModule {}
