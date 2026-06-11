import { ApiProperty } from '@nestjs/swagger';
import { Type } from 'class-transformer';
import { IsInt, IsUUID, Min } from 'class-validator';

export class ProgressEventDto {
  @ApiProperty({
    description: 'UUID of the learning item the user interacted with.',
    format: 'uuid',
    example: 'd1f8c2a0-3b45-4f6e-8a9b-0c1d2e3f4a5b',
  })
  @IsUUID()
  itemId: string;

  @ApiProperty({
    description:
      'Number of times the image was viewed since the last flush. Added to the cumulative server-side counter.',
    minimum: 0,
    example: 3,
  })
  @Type(() => Number)
  @IsInt()
  @Min(0)
  views: number;

  @ApiProperty({
    description:
      'Number of times the pronunciation audio was played since the last flush. Added to the cumulative server-side counter.',
    minimum: 0,
    example: 2,
  })
  @Type(() => Number)
  @IsInt()
  @Min(0)
  listens: number;
}
