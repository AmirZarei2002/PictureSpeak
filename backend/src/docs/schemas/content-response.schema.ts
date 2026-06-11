import { ApiProperty } from '@nestjs/swagger';

export class CategoryResponse {
  @ApiProperty({
    description: 'UUID of the category.',
    format: 'uuid',
    example: '6d2a3f08-7a51-4f9c-9d6f-2e3b6c41e7ad',
  })
  id!: string;

  @ApiProperty({
    description:
      'URL-safe slug used as the public identifier in routes (e.g. `/categories/animals/items`).',
    pattern: '^[a-z0-9-]+$',
    example: 'animals',
  })
  slug!: string;

  @ApiProperty({
    description: 'Display name of the category.',
    example: 'Animals',
  })
  name!: string;

  @ApiProperty({
    description:
      'Relative path to the cover image (joined with the CDN/base URL by clients).',
    example: 'categories/animals/cover.webp',
  })
  coverImagePath!: string;

  @ApiProperty({
    description:
      'Brand color for the category, used as the card background tint.',
    pattern: '^#[0-9a-fA-F]{6}$',
    example: '#7BAFD4',
  })
  colorHex!: string;

  @ApiProperty({
    description:
      'Ascending sort order applied by the client when rendering category lists.',
    example: 10,
  })
  sortOrder!: number;

  @ApiProperty({
    description: 'Whether the category is currently visible to end users.',
    example: true,
  })
  isActive!: boolean;

  @ApiProperty({
    description: 'Number of active learning items in this category.',
    example: 24,
  })
  itemCount!: number;
}

export class LearningItemResponse {
  @ApiProperty({
    format: 'uuid',
    example: 'd1f8c2a0-3b45-4f6e-8a9b-0c1d2e3f4a5b',
  })
  id!: string;

  @ApiProperty({
    description: 'UUID of the parent category.',
    format: 'uuid',
    example: '6d2a3f08-7a51-4f9c-9d6f-2e3b6c41e7ad',
  })
  categoryId!: string;

  @ApiProperty({
    description: 'URL-safe slug, unique within its category.',
    pattern: '^[a-z0-9-]+$',
    example: 'elephant',
  })
  slug!: string;

  @ApiProperty({ example: 'Elephant' })
  name!: string;

  @ApiProperty({
    description: 'Relative path to the full-resolution image.',
    example: 'items/animals/elephant.webp',
  })
  imagePath!: string;

  @ApiProperty({
    description: 'Relative path to the thumbnail (preferred for list views).',
    nullable: true,
    example: 'items/animals/elephant.thumb.webp',
  })
  thumbnailPath!: string | null;

  @ApiProperty({
    description: 'Relative path to the pronunciation audio clip.',
    nullable: true,
    example: 'items/animals/elephant.mp3',
  })
  audioPath!: string | null;

  @ApiProperty({ example: 30 })
  sortOrder!: number;

  @ApiProperty({ example: true })
  isActive!: boolean;
}
