import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsBoolean,
  IsInt,
  IsOptional,
  IsString,
  Matches,
  MaxLength,
  Min,
  MinLength,
} from 'class-validator';

const SLUG_REGEX = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;

export class CreateItemDto {
  @ApiProperty({
    description: 'Display name of the learning item.',
    minLength: 1,
    maxLength: 80,
    example: 'Elephant',
  })
  @IsString()
  @MinLength(1)
  @MaxLength(80)
  name!: string;

  @ApiProperty({
    description:
      'URL-safe identifier. Must be unique within the parent category. Lowercase letters, digits, and hyphens only.',
    pattern: '^[a-z0-9]+(?:-[a-z0-9]+)*$',
    maxLength: 80,
    example: 'elephant',
  })
  @IsString()
  @Matches(SLUG_REGEX, {
    message: 'slug must be lowercase letters, numbers, and hyphens only',
  })
  @MaxLength(80)
  slug!: string;

  @ApiProperty({
    description: 'Relative path to the full-resolution image.',
    maxLength: 255,
    example: 'items/animals/elephant.webp',
  })
  @IsString()
  @MaxLength(255)
  imagePath!: string;

  @ApiPropertyOptional({
    description: 'Relative path to the thumbnail (preferred for list views).',
    maxLength: 255,
    example: 'items/animals/elephant.thumb.webp',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  thumbnailPath?: string;

  @ApiPropertyOptional({
    description: 'Relative path to the pronunciation audio clip.',
    maxLength: 255,
    example: 'items/animals/elephant.mp3',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  audioPath?: string;

  @ApiPropertyOptional({
    description: 'Ascending sort order within the category.',
    minimum: 0,
    example: 30,
  })
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiPropertyOptional({
    description:
      'Whether the item is visible to learners. Defaults to `true` server-side when omitted.',
    example: true,
  })
  @IsOptional()
  @IsBoolean()
  isActive?: boolean;
}
