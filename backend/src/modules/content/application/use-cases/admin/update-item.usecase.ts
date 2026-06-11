import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import {
  IFindItemByIdRepository,
  IFindItemBySlugInCategoryRepository,
  IUpdateItemRepository,
} from '@modules/content/domain/interfaces/content.repository.interface';
import { UpdateItemDto } from '../../dtos/admin/update-item.dto';

@Injectable()
export class UpdateItemUseCase {
  constructor(
    private readonly findItemByIdRepository: IFindItemByIdRepository,
    private readonly findItemBySlugRepository: IFindItemBySlugInCategoryRepository,
    private readonly updateItemRepository: IUpdateItemRepository,
  ) {}

  async execute(id: string, data: UpdateItemDto): Promise<LearningItemEntity> {
    const i18n = I18nContext.current();

    const current = await this.findItemByIdRepository.findById(id);
    if (!current) {
      throw new NotFoundException(
        i18n?.t('admin.ITEM_NOT_FOUND_BY_ID', { args: { id } }) ??
          `Item ${id} not found`,
      );
    }

    if (data.slug && data.slug !== current.slug) {
      const taken = await this.findItemBySlugRepository.findBySlugInCategory(
        current.categoryId,
        data.slug,
      );
      if (taken) {
        throw new ConflictException(
          i18n?.t('admin.ITEM_SLUG_TAKEN', { args: { slug: data.slug } }) ??
            `An item with slug "${data.slug}" already exists in this category`,
        );
      }
    }

    const updated = await this.updateItemRepository.update(id, data);
    if (!updated) {
      throw new NotFoundException(
        i18n?.t('admin.ITEM_NOT_FOUND_BY_ID', { args: { id } }) ??
          `Item ${id} not found`,
      );
    }
    return updated;
  }
}
