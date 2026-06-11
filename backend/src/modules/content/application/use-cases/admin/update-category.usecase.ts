import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import {
  IFindCategoryByIdRepository,
  IFindCategoryBySlugRepository,
  IUpdateCategoryRepository,
} from '@modules/content/domain/interfaces/content.repository.interface';
import { UpdateCategoryDto } from '../../dtos/admin/update-category.dto';

@Injectable()
export class UpdateCategoryUseCase {
  constructor(
    private readonly findByIdRepository: IFindCategoryByIdRepository,
    private readonly findBySlugRepository: IFindCategoryBySlugRepository,
    private readonly updateRepository: IUpdateCategoryRepository,
  ) {}

  async execute(id: string, data: UpdateCategoryDto): Promise<CategoryEntity> {
    const i18n = I18nContext.current();

    const current = await this.findByIdRepository.findById(id);
    if (!current) {
      throw new NotFoundException(
        i18n?.t('admin.CATEGORY_NOT_FOUND_BY_ID', { args: { id } }) ??
          `Category ${id} not found`,
      );
    }

    if (data.slug && data.slug !== current.slug) {
      const slugTaken = await this.findBySlugRepository.findBySlug(data.slug);
      if (slugTaken) {
        throw new ConflictException(
          i18n?.t('admin.CATEGORY_SLUG_TAKEN', {
            args: { slug: data.slug },
          }) ?? `A category with slug "${data.slug}" already exists`,
        );
      }
    }

    const updated = await this.updateRepository.update(id, data);
    if (!updated) {
      throw new NotFoundException(
        i18n?.t('admin.CATEGORY_NOT_FOUND_BY_ID', { args: { id } }) ??
          `Category ${id} not found`,
      );
    }
    return updated;
  }
}
