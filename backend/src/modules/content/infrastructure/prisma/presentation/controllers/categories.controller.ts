import { Controller, Get, Param, UseInterceptors } from '@nestjs/common';
import {
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
} from '@nestjs/swagger';
import { CacheInterceptor } from '@shared/cache/cache.interceptor';
import { GetCategoriesUseCase } from '@modules/content/application/use-cases/get-categories.usecase';
import { GetItemsByCategorySlugUseCase } from '@modules/content/application/use-cases/get-items-by-category-slug.usecase';
import { TAGS } from '@docs/constants';
import { ApiStandardErrors } from '@docs/decorators/api-standard-errors.decorator';
import {
  CategoryResponse,
  LearningItemResponse,
} from '@docs/schemas/content-response.schema';

@ApiTags(TAGS.Categories)
@Controller('categories')
export class CategoriesController {
  constructor(
    private readonly getCategoriesUseCase: GetCategoriesUseCase,
    private readonly getItemsByCategorySlugUseCase: GetItemsByCategorySlugUseCase,
  ) {}

  @Get()
  @UseInterceptors(CacheInterceptor)
  @ApiOperation({
    summary: 'List all active categories',
    description:
      'Returns every active category in display order. The response is cached server-side via the cache interceptor — clients can poll on app launch without measurable load on the database. Public endpoint; no authentication required.',
  })
  @ApiOkResponse({
    description: 'List of active categories, sorted ascending by `sortOrder`.',
    type: [CategoryResponse],
  })
  @ApiStandardErrors()
  findAll() {
    return this.getCategoriesUseCase.execute();
  }

  @Get(':slug/items')
  @UseInterceptors(CacheInterceptor)
  @ApiOperation({
    summary: 'List learning items in a category',
    description:
      'Returns every active learning item that belongs to the category identified by `slug`. Items are sorted ascending by `sortOrder`. Public endpoint; cached server-side.',
  })
  @ApiParam({
    name: 'slug',
    description: 'URL-safe category slug, as returned by `GET /categories`.',
    example: 'animals',
    schema: { type: 'string', pattern: '^[a-z0-9-]+$' },
  })
  @ApiOkResponse({
    description: 'List of active learning items in the category.',
    type: [LearningItemResponse],
  })
  @ApiStandardErrors({
    notFound: 'No category exists with the provided slug.',
  })
  findItems(@Param('slug') slug: string) {
    return this.getItemsByCategorySlugUseCase.execute(slug);
  }
}
