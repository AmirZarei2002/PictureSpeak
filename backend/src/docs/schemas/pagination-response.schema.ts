import { ApiProperty } from '@nestjs/swagger';

export class PaginationMetaResponse {
  @ApiProperty({
    description: 'Total matching rows across all pages.',
    example: 137,
  })
  total!: number;

  @ApiProperty({ description: 'Current page (1-indexed).', example: 1 })
  page!: number;

  @ApiProperty({ description: 'Page size.', example: 20 })
  size!: number;

  @ApiProperty({
    description: 'Last page index given the current page size.',
    example: 7,
  })
  lastPage!: number;

  @ApiProperty({
    description: 'Previous page index, or `null` on the first page.',
    nullable: true,
    example: null,
  })
  prevPage!: number | null;

  @ApiProperty({
    description: 'Next page index, or `null` on the last page.',
    nullable: true,
    example: 2,
  })
  nextPage!: number | null;
}
