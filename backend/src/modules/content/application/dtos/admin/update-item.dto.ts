import { ApiPropertyOptional } from '@nestjs/swagger';
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

export class UpdateItemDto {
  @ApiPropertyOptional({
    description: 'New display name.',
    minLength: 1,
    maxLength: 80,
    example: 'Elephant',
  })
  @IsOptional()
  @IsString()
  @MinLength(1)
  @MaxLength(80)
  name?: string;

  @ApiPropertyOptional({
    description:
      'New slug. Must remain unique within the parent category. Lowercase letters, digits, and hyphens only.',
    pattern: '^[a-z0-9]+(?:-[a-z0-9]+)*$',
    maxLength: 80,
    example: 'elephant',
  })
  @IsOptional()
  @IsString()
  @Matches(SLUG_REGEX, {
    message: 'slug must be lowercase letters, numbers, and hyphens only',
  })
  @MaxLength(80)
  slug?: string;

  @ApiPropertyOptional({
    description: 'New relative path to the full-resolution image.',
    maxLength: 255,
    example: 'items/animals/elephant.webp',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  imagePath?: string;

  @ApiPropertyOptional({
    description:
      'New thumbnail path. Send `null` or an empty string to clear the existing value.',
    maxLength: 255,
    nullable: true,
    example: 'items/animals/elephant.thumb.webp',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  thumbnailPath?: string | null;

  @ApiPropertyOptional({
    description:
      'New audio path. Send `null` or an empty string to clear the existing value.',
    maxLength: 255,
    nullable: true,
    example: 'items/animals/elephant.mp3',
  })
  @IsOptional()
  @IsString()
  @MaxLength(255)
  audioPath?: string | null;

  @ApiPropertyOptional({
    description: 'New ascending sort order.',
    minimum: 0,
    example: 30,
  })
  @IsOptional()
  @IsInt()
  @Min(0)
  sortOrder?: number;

  @ApiPropertyOptional({
    description: 'Toggle item visibility (`false` hides without deleting).',
    example: true,
  })
  @IsOptional()
  @IsBoolean()
  isActive?: boolean;
}
