import { ApiProperty } from '@nestjs/swagger';

export class FavoriteItemResponse {
  @ApiProperty({
    description: 'UUID of the favorited learning item.',
    format: 'uuid',
    example: 'd1f8c2a0-3b45-4f6e-8a9b-0c1d2e3f4a5b',
  })
  itemId!: string;

  @ApiProperty({ example: 'elephant' })
  itemSlug!: string;

  @ApiProperty({ example: 'Elephant' })
  itemName!: string;

  @ApiProperty({ example: 'items/animals/elephant.webp' })
  imagePath!: string;

  @ApiProperty({ nullable: true, example: 'items/animals/elephant.thumb.webp' })
  thumbnailPath!: string | null;

  @ApiProperty({ nullable: true, example: 'items/animals/elephant.mp3' })
  audioPath!: string | null;

  @ApiProperty({
    format: 'uuid',
    example: '6d2a3f08-7a51-4f9c-9d6f-2e3b6c41e7ad',
  })
  categoryId!: string;

  @ApiProperty({ example: 'animals' })
  categorySlug!: string;

  @ApiProperty({ example: 'Animals' })
  categoryName!: string;

  @ApiProperty({ example: '#7BAFD4' })
  categoryColorHex!: string;

  @ApiProperty({
    description: 'When the item was added to favorites.',
    format: 'date-time',
    example: '2026-06-01T19:42:11.000Z',
  })
  favoritedAt!: string;
}
