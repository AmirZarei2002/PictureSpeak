import { Module } from '@nestjs/common';
import { CustomCacheModule } from '@shared/cache/cache.module';
import { PrismaService } from '@prisma/prisma.service';
import { CreateCategoryUseCase } from './application/use-cases/admin/create-category.usecase';
import { CreateItemUseCase } from './application/use-cases/admin/create-item.usecase';
import { DeleteCategoryUseCase } from './application/use-cases/admin/delete-category.usecase';
import { DeleteItemUseCase } from './application/use-cases/admin/delete-item.usecase';
import { ListAllCategoriesUseCase } from './application/use-cases/admin/list-all-categories.usecase';
import { ListItemsByCategoryIdUseCase } from './application/use-cases/admin/list-items-by-category-id.usecase';
import { UpdateCategoryUseCase } from './application/use-cases/admin/update-category.usecase';
import { UpdateItemUseCase } from './application/use-cases/admin/update-item.usecase';
import { GetCategoriesUseCase } from './application/use-cases/get-categories.usecase';
import { GetItemsByCategorySlugUseCase } from './application/use-cases/get-items-by-category-slug.usecase';
import {
  IFindCategoriesRepository,
  IFindItemsByCategorySlugRepository,
} from './domain/interfaces/content.repository.interface';
import { CountCategoryItemsRepository } from './infrastructure/prisma/persistence/admin/count-category-items.repository';
import { CreateCategoryRepository } from './infrastructure/prisma/persistence/admin/create-category.repository';
import { CreateItemRepository } from './infrastructure/prisma/persistence/admin/create-item.repository';
import { DeleteCategoryRepository } from './infrastructure/prisma/persistence/admin/delete-category.repository';
import { DeleteItemRepository } from './infrastructure/prisma/persistence/admin/delete-item.repository';
import { FindCategoryByIdRepository } from './infrastructure/prisma/persistence/admin/find-category-by-id.repository';
import { FindCategoryBySlugRepository } from './infrastructure/prisma/persistence/admin/find-category-by-slug.repository';
import { FindItemByIdRepository } from './infrastructure/prisma/persistence/admin/find-item-by-id.repository';
import { FindItemBySlugInCategoryRepository } from './infrastructure/prisma/persistence/admin/find-item-by-slug-in-category.repository';
import { ListAllCategoriesRepository } from './infrastructure/prisma/persistence/admin/list-all-categories.repository';
import { ListItemsByCategoryIdRepository } from './infrastructure/prisma/persistence/admin/list-items-by-category-id.repository';
import { UpdateCategoryRepository } from './infrastructure/prisma/persistence/admin/update-category.repository';
import { UpdateItemRepository } from './infrastructure/prisma/persistence/admin/update-item.repository';
import { GetCategoriesRepository } from './infrastructure/prisma/persistence/get-categories.repository';
import { GetItemsByCategorySlugRepository } from './infrastructure/prisma/persistence/get-items-by-category-slug.repository';
import { AdminCategoriesController } from './infrastructure/prisma/presentation/controllers/admin-categories.controller';
import { AdminItemsController } from './infrastructure/prisma/presentation/controllers/admin-items.controller';
import { CategoriesController } from './infrastructure/prisma/presentation/controllers/categories.controller';

@Module({
  imports: [CustomCacheModule],
  controllers: [
    CategoriesController,
    AdminCategoriesController,
    AdminItemsController,
  ],
  providers: [
    PrismaService,

    GetCategoriesRepository,
    GetItemsByCategorySlugRepository,
    ListAllCategoriesRepository,
    FindCategoryByIdRepository,
    FindCategoryBySlugRepository,
    CreateCategoryRepository,
    UpdateCategoryRepository,
    DeleteCategoryRepository,
    CountCategoryItemsRepository,
    ListItemsByCategoryIdRepository,
    FindItemByIdRepository,
    FindItemBySlugInCategoryRepository,
    CreateItemRepository,
    UpdateItemRepository,
    DeleteItemRepository,

    {
      provide: GetCategoriesUseCase,
      useFactory: (repo: IFindCategoriesRepository) =>
        new GetCategoriesUseCase(repo),
      inject: [GetCategoriesRepository],
    },
    {
      provide: GetItemsByCategorySlugUseCase,
      useFactory: (repo: IFindItemsByCategorySlugRepository) =>
        new GetItemsByCategorySlugUseCase(repo),
      inject: [GetItemsByCategorySlugRepository],
    },
    {
      provide: ListAllCategoriesUseCase,
      useFactory: (repo: ListAllCategoriesRepository) =>
        new ListAllCategoriesUseCase(repo),
      inject: [ListAllCategoriesRepository],
    },
    {
      provide: CreateCategoryUseCase,
      useFactory: (
        findBySlug: FindCategoryBySlugRepository,
        create: CreateCategoryRepository,
      ) => new CreateCategoryUseCase(findBySlug, create),
      inject: [FindCategoryBySlugRepository, CreateCategoryRepository],
    },
    {
      provide: UpdateCategoryUseCase,
      useFactory: (
        findById: FindCategoryByIdRepository,
        findBySlug: FindCategoryBySlugRepository,
        update: UpdateCategoryRepository,
      ) => new UpdateCategoryUseCase(findById, findBySlug, update),
      inject: [
        FindCategoryByIdRepository,
        FindCategoryBySlugRepository,
        UpdateCategoryRepository,
      ],
    },
    {
      provide: DeleteCategoryUseCase,
      useFactory: (
        findById: FindCategoryByIdRepository,
        count: CountCategoryItemsRepository,
        del: DeleteCategoryRepository,
      ) => new DeleteCategoryUseCase(findById, count, del),
      inject: [
        FindCategoryByIdRepository,
        CountCategoryItemsRepository,
        DeleteCategoryRepository,
      ],
    },
    {
      provide: ListItemsByCategoryIdUseCase,
      useFactory: (
        findCategory: FindCategoryByIdRepository,
        listItems: ListItemsByCategoryIdRepository,
      ) => new ListItemsByCategoryIdUseCase(findCategory, listItems),
      inject: [FindCategoryByIdRepository, ListItemsByCategoryIdRepository],
    },
    {
      provide: CreateItemUseCase,
      useFactory: (
        findCategory: FindCategoryByIdRepository,
        findItemBySlug: FindItemBySlugInCategoryRepository,
        create: CreateItemRepository,
      ) => new CreateItemUseCase(findCategory, findItemBySlug, create),
      inject: [
        FindCategoryByIdRepository,
        FindItemBySlugInCategoryRepository,
        CreateItemRepository,
      ],
    },
    {
      provide: UpdateItemUseCase,
      useFactory: (
        findById: FindItemByIdRepository,
        findBySlug: FindItemBySlugInCategoryRepository,
        update: UpdateItemRepository,
      ) => new UpdateItemUseCase(findById, findBySlug, update),
      inject: [
        FindItemByIdRepository,
        FindItemBySlugInCategoryRepository,
        UpdateItemRepository,
      ],
    },
    {
      provide: DeleteItemUseCase,
      useFactory: (del: DeleteItemRepository) => new DeleteItemUseCase(del),
      inject: [DeleteItemRepository],
    },
  ],
})
export class ContentModule {}
