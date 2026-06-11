import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import {
  ICreateItemRepository,
  IFindCategoryByIdRepository,
  IFindItemBySlugInCategoryRepository,
} from '@modules/content/domain/interfaces/content.repository.interface';
import { CreateItemDto } from '../../dtos/admin/create-item.dto';

@Injectable()
export class CreateItemUseCase {
  constructor(
    private readonly findCategoryByIdRepository: IFindCategoryByIdRepository,
    private readonly findItemBySlugRepository: IFindItemBySlugInCategoryRepository,
    private readonly createItemRepository: ICreateItemRepository,
  ) {}

  async execute(
    categoryId: string,
    data: CreateItemDto,
  ): Promise<LearningItemEntity> {
    const i18n = I18nContext.current();

    const category = await this.findCategoryByIdRepository.findById(categoryId);
    if (!category) {
      throw new NotFoundException(
        i18n?.t('admin.CATEGORY_NOT_FOUND_BY_ID', {
          args: { id: categoryId },
        }) ?? `Category ${categoryId} not found`,
      );
    }

    const taken = await this.findItemBySlugRepository.findBySlugInCategory(
      categoryId,
      data.slug,
    );
    if (taken) {
      throw new ConflictException(
        i18n?.t('admin.ITEM_SLUG_TAKEN', { args: { slug: data.slug } }) ??
          `An item with slug "${data.slug}" already exists in this category`,
      );
    }

    return this.createItemRepository.create({
      categoryId,
      slug: data.slug,
      name: data.name,
      imagePath: data.imagePath,
      thumbnailPath: data.thumbnailPath,
      audioPath: data.audioPath,
      sortOrder: data.sortOrder,
      isActive: data.isActive,
    });
  }
}
