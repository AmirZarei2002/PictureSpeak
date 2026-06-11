import { NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';

export class EntityNotFoundException extends NotFoundException {
  constructor(entity: string, id?: string | number) {
    const i18n = I18nContext.current();
    const translated =
      id !== undefined
        ? i18n?.t('errors.ENTITY_NOT_FOUND_BY_ID', { args: { entity, id } })
        : i18n?.t('errors.ENTITY_NOT_FOUND', { args: { entity } });

    const fallback =
      `${entity} ${id !== undefined ? `with id ${id} ` : ''}not found`.trim();

    super(translated ?? fallback);
  }
}
