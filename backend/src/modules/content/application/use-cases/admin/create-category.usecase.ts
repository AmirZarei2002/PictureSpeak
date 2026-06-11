import { ConflictException, Injectable } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import {
  ICreateCategoryRepository,
  IFindCategoryBySlugRepository,
} from '@modules/content/domain/interfaces/content.repository.interface';
import { CreateCategoryDto } from '../../dtos/admin/create-category.dto';

@Injectable()
export class CreateCategoryUseCase {
  constructor(
    private readonly findBySlugRepository: IFindCategoryBySlugRepository,
    private readonly createRepository: ICreateCategoryRepository,
  ) {}

  async execute(data: CreateCategoryDto): Promise<CategoryEntity> {
    const existing = await this.findBySlugRepository.findBySlug(data.slug);
    if (existing) {
      throw new ConflictException(
        I18nContext.current()?.t('admin.CATEGORY_SLUG_TAKEN', {
          args: { slug: data.slug },
        }) ?? `A category with slug "${data.slug}" already exists`,
      );
    }
    return this.createRepository.create({
      slug: data.slug,
      name: data.name,
      coverImagePath: data.coverImagePath,
      colorHex: data.colorHex,
      sortOrder: data.sortOrder,
      isActive: data.isActive,
    });
  }
}
