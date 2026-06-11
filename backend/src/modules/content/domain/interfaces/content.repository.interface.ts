import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';

export interface IFindCategoriesRepository {
  findAll(): Promise<CategoryEntity[]>;
}

export interface IFindItemsByCategorySlugRepository {
  findByCategorySlug(slug: string): Promise<LearningItemEntity[] | null>;
}

export interface CreateCategoryData {
  slug: string;
  name: string;
  coverImagePath: string;
  colorHex?: string;
  sortOrder?: number;
  isActive?: boolean;
}

export interface UpdateCategoryData {
  slug?: string;
  name?: string;
  coverImagePath?: string;
  colorHex?: string;
  sortOrder?: number;
  isActive?: boolean;
}

export interface IListAllCategoriesRepository {
  listAll(): Promise<CategoryEntity[]>;
}

export interface IFindCategoryByIdRepository {
  findById(id: string): Promise<CategoryEntity | null>;
}

export interface IFindCategoryBySlugRepository {
  findBySlug(slug: string): Promise<CategoryEntity | null>;
}

export interface ICreateCategoryRepository {
  create(data: CreateCategoryData): Promise<CategoryEntity>;
}

export interface IUpdateCategoryRepository {
  update(id: string, data: UpdateCategoryData): Promise<CategoryEntity | null>;
}

export interface IDeleteCategoryRepository {
  delete(id: string): Promise<boolean>;
}

export interface ICountCategoryItemsRepository {
  count(categoryId: string): Promise<number>;
}

export interface CreateItemData {
  categoryId: string;
  slug: string;
  name: string;
  imagePath: string;
  thumbnailPath?: string | null;
  audioPath?: string | null;
  sortOrder?: number;
  isActive?: boolean;
}

export interface UpdateItemData {
  slug?: string;
  name?: string;
  imagePath?: string;
  thumbnailPath?: string | null;
  audioPath?: string | null;
  sortOrder?: number;
  isActive?: boolean;
}

export interface IListItemsByCategoryIdRepository {
  list(categoryId: string): Promise<LearningItemEntity[]>;
}

export interface IFindItemByIdRepository {
  findById(id: string): Promise<LearningItemEntity | null>;
}

export interface IFindItemBySlugInCategoryRepository {
  findBySlugInCategory(
    categoryId: string,
    slug: string,
  ): Promise<LearningItemEntity | null>;
}

export interface ICreateItemRepository {
  create(data: CreateItemData): Promise<LearningItemEntity>;
}

export interface IUpdateItemRepository {
  update(id: string, data: UpdateItemData): Promise<LearningItemEntity | null>;
}

export interface IDeleteItemRepository {
  delete(id: string): Promise<boolean>;
}
