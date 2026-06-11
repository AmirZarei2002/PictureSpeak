import { Injectable, NotFoundException } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { LearningItemEntity } from '@modules/content/domain/entities/learning-item.entity';
import { IFindItemsByCategorySlugRepository } from '@modules/content/domain/interfaces/content.repository.interface';

@Injectable()
export class GetItemsByCategorySlugUseCase {
  constructor(
    private readonly findItemsByCategorySlugRepository: IFindItemsByCategorySlugRepository,
  ) {}

  async execute(slug: string): Promise<LearningItemEntity[]> {
    const items =
      await this.findItemsByCategorySlugRepository.findByCategorySlug(slug);

    if (items === null) {
      throw new NotFoundException(
        I18nContext.current()?.t('content.CATEGORY_NOT_FOUND', {
          args: { slug },
        }),
      );
    }

    return items;
  }
}
