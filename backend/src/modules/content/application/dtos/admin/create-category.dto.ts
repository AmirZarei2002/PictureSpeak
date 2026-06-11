import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsBoolean,
  IsHexColor,
  IsInt,
  IsOptional,
  IsString,
  Matches,
  MaxLength,
  Min,
  MinLength,
} from 'class-validator';

const SLUG_REGEX = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;

export class CreateCategoryDto {
  @ApiProperty({
    description: 'Display name of the category.',
    minLength: 1,
    maxLength: 80,
    example: 'Animals',
  })
  @IsString()
  @MinLength(1)
  @MaxLength(80)
  name!: string;

  @ApiProperty({
    description:
      'URL-safe identifier — lowercase letters, digits, and hyphens. Must be unique across all categories.',
    pattern: '^[a-z0-9]+(?:-[a-z0-9]+)*$',
    maxLength: 80,
    example: 'animals',
  })
  @IsString()
  @Matches(SLUG_REGEX, {
    message: 'slug must be lowercase letters, numbers, and hyphens only',
  })
  @MaxLength(80)
  slug!: string;

  @ApiProperty({
    description: 'Relative path to the cover image.',
    maxLength: 255,
    example: 'categories/animals/cover.webp',
  })
  @IsString()
  @MaxLength(255)
  coverImagePath!: string;

  @ApiPropertyOptional({
    description: 'Brand color for the category card (CSS hex, `#RRGGBB`).',
    pattern: '^#[0-9a-fA-F]{6}$',
    example: '#7BAFD4',
  })
  @IsOptional()
  @IsHexColor()
  colorHex?: string;

  @ApiPropertyOptional({
    description:
      'Ascending sort order used by the client when rendering category lists.',
    minimum: 0,
    example: 10,
  })
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiPropertyOptional({
    description:
      'Whether the category is visible to learners. Defaults to `true` server-side when omitted.',
    example: true,
  })
  @IsOptional()
  @IsBoolean()
  isActive?: boolean;
}
