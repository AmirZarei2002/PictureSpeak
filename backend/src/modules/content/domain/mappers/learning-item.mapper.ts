import { LearningItem as PrismaLearningItem } from '@prisma/client';
import { LearningItemEntity } from '../entities/learning-item.entity';

export class LearningItemMapper {
  static toEntity(item: PrismaLearningItem): LearningItemEntity {
    return new LearningItemEntity(
      item.id,
      item.categoryId,
      item.slug,
      item.name,
      item.imagePath,
      item.thumbnailPath,
      item.audioPath,
      item.sortOrder,
      item.isActive,
    );
  }
}
