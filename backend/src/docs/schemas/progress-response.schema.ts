import { ApiProperty } from '@nestjs/swagger';

export class CategoryProgressResponse {
  @ApiProperty({
    format: 'uuid',
    example: '6d2a3f08-7a51-4f9c-9d6f-2e3b6c41e7ad',
  })
  categoryId!: string;

  @ApiProperty({ example: 'animals' })
  categorySlug!: string;

  @ApiProperty({ example: 'Animals' })
  categoryName!: string;

  @ApiProperty({
    description:
      'Number of distinct items the user has either viewed or listened to in this category.',
    minimum: 0,
    example: 7,
  })
  explored!: number;

  @ApiProperty({
    description: 'Total active items in the category.',
    minimum: 0,
    example: 24,
  })
  total!: number;
}

export class ProgressSummaryResponse {
  @ApiProperty({
    description:
      'Cumulative count of `view` events the user has recorded across all items.',
    minimum: 0,
    example: 412,
  })
  totalViews!: number;

  @ApiProperty({
    description:
      'Cumulative count of `listen` events the user has recorded across all items.',
    minimum: 0,
    example: 138,
  })
  totalListens!: number;

  @ApiProperty({
    description: 'Number of distinct items the user has interacted with.',
    minimum: 0,
    example: 53,
  })
  itemsExplored!: number;

  @ApiProperty({
    description:
      'Per-category breakdown for rendering progress bars in the client.',
    type: [CategoryProgressResponse],
  })
  byCategory!: CategoryProgressResponse[];
}
