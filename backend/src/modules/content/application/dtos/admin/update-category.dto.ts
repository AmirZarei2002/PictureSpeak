import { ApiPropertyOptional } from '@nestjs/swagger';
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

export class UpdateCategoryDto {
  @ApiPropertyOptional({
    description: 'New display name.',
    minLength: 1,
    maxLength: 80,
    example: 'Animals',
  })
  @IsOptional()
  @IsString()
  @MinLength(1)
  @MaxLength(80)
  name?: string;

  @ApiPropertyOptional({
    description:
      'New slug. Must remain unique across all categories. Lowercase letters, digits, and hyphens only.',
    pattern: '^[a-z0-9]+(?:-[a-z0-9]+)*$',
    maxLength: 80,
    example: 'animals',
  })
  @IsOptional()
  @IsString()
  @Matches(SLUG_REGEX, {
    message: 'slug must be lowercase letters, numbers, and hyphens only',
  })
  @MaxLength(80)
  slug?: string;

  @ApiPropertyOptional({
    description: 'New relative path to the cover image.',
    maxLength: 255,
    example: 'categories/animals/cover.webp',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  coverImagePath?: string;

  @ApiPropertyOptional({
    description: 'New brand color (CSS hex, `#RRGGBB`).',
    pattern: '^#[0-9a-fA-F]{6}$',
    example: '#7BAFD4',
  })
  @IsOptional()
  @IsHexColor()
  colorHex?: string;

  @ApiPropertyOptional({
    description: 'New ascending sort order.',
    minimum: 0,
    example: 10,
  })
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiPropertyOptional({
    description:
      'Toggle category visibility. Set to `false` to hide from learners without deleting.',
    example: true,
  })
  @IsOptional()
  @IsBoolean()
  isActive?: boolean;
}
