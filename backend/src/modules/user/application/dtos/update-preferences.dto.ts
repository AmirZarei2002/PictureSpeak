import { ApiPropertyOptional } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import {
  IsBoolean,
  IsEnum,
  IsNumber,
  IsOptional,
  IsString,
  Length,
  Max,
  Min,
} from 'class-validator';
import { TextScale, ThemeMode } from '@prisma/client';

export class UpdatePreferencesDto {
  @ApiPropertyOptional({
    description: 'New display name, 1–50 characters.',
    minLength: 1,
    maxLength: 50,
    example: 'Sara T.',
  })
  @IsOptional()
  @IsString()
  @Length(1, 50)
  displayName?: string;

  @ApiPropertyOptional({
    description: 'Preferred text scale for the mobile client.',
    enum: TextScale,
    enumName: 'TextScale',
    example: TextScale.large,
  })
  @IsOptional()
  @IsEnum(TextScale)
  textScale?: TextScale;

  @ApiPropertyOptional({
    description: 'Preferred color theme for the mobile client.',
    enum: ThemeMode,
    enumName: 'ThemeMode',
    example: ThemeMode.dark,
  })
  @IsOptional()
  @IsEnum(ThemeMode)
  themeMode?: ThemeMode;

  @ApiPropertyOptional({
    description: 'Speech rate multiplier for text-to-speech (0.5 – 2.0).',
    minimum: 0.5,
    maximum: 2.0,
    example: 1.25,
  })
  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  @Min(0.5)
  @Max(2.0)
  speechRate?: number;

  @ApiPropertyOptional({
    description: 'Whether UI sound effects should play.',
    example: true,
  })
  @IsOptional()
  @IsBoolean()
  soundEffectsOn?: boolean;
}
