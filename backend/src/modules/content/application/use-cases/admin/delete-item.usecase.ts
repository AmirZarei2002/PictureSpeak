import { Injectable, NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { IDeleteItemRepository } from '@modules/content/domain/interfaces/content.repository.interface';

@Injectable()
export class DeleteItemUseCase {
  constructor(private readonly deleteItemRepository: IDeleteItemRepository) {}

  async execute(id: string): Promise<void> {
    const ok = await this.deleteItemRepository.delete(id);
    if (!ok) {
      throw new NotFoundException(
        I18nContext.current()?.t('admin.ITEM_NOT_FOUND_BY_ID', {
          args: { id },
        }) ?? `Item ${id} not found`,
      );
    }
  }
}
