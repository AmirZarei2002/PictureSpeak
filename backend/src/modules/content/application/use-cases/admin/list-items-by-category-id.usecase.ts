import { Injectable, NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import {
  IFindCategoryByIdRepository,
  IListItemsByCategoryIdRepository,
} from '@modules/content/domain/interfaces/content.repository.interface';

@Injectable()
export class ListItemsByCategoryIdUseCase {
  constructor(
    private readonly findCategoryByIdRepository: IFindCategoryByIdRepository,
    private readonly listItemsRepository: IListItemsByCategoryIdRepository,
  ) {}

  async execute(categoryId: string): Promise<LearningItemEntity[]> {
    const category = await this.findCategoryByIdRepository.findById(categoryId);
    if (!category) {
      throw new NotFoundException(
        I18nContext.current()?.t('admin.CATEGORY_NOT_FOUND_BY_ID', {
          args: { id: categoryId },
        }) ?? `Category ${categoryId} not found`,
      );
    }
    return this.listItemsRepository.list(categoryId);
  }
}
