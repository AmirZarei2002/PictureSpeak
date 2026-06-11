import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import {
  ICountCategoryItemsRepository,
  IDeleteCategoryRepository,
  IFindCategoryByIdRepository,
} from '@modules/content/domain/interfaces/content.repository.interface';

@Injectable()
export class DeleteCategoryUseCase {
  constructor(
    private readonly findByIdRepository: IFindCategoryByIdRepository,
    private readonly countItemsRepository: ICountCategoryItemsRepository,
    private readonly deleteRepository: IDeleteCategoryRepository,
  ) {}

  async execute(id: string): Promise<void> {
    const i18n = I18nContext.current();

    const current = await this.findByIdRepository.findById(id);
    if (!current) {
      throw new NotFoundException(
        i18n?.t('admin.CATEGORY_NOT_FOUND_BY_ID', { args: { id } }) ??
          `Category ${id} not found`,
      );
    }

    const itemCount = await this.countItemsRepository.count(id);
    if (itemCount > 0) {
      throw new ConflictException(
        i18n?.t('admin.CATEGORY_HAS_ITEMS', { args: { count: itemCount } }) ??
          `Category has ${itemCount} learning item(s)`,
      );
    }

    const deleted = await this.deleteRepository.delete(id);
    if (!deleted) {
      throw new NotFoundException(
        i18n?.t('admin.CATEGORY_NOT_FOUND_BY_ID', { args: { id } }) ??
          `Category ${id} not found`,
      );
    }
  }
}
