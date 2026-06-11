import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  ParseUUIDPipe,
  Patch,
  Post,
  UseGuards,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBody,
  ApiCreatedResponse,
  ApiNoContentResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
} from '@nestjs/swagger';
import { AdminGuard } from '@common/guards/admin.guard';
import { JwtAuthGuard } from '@common/guards/jwt-auth.guard';
import { CreateCategoryDto } from '@modules/content/application/dtos/admin/create-category.dto';
import { UpdateCategoryDto } from '@modules/content/application/dtos/admin/update-category.dto';
import { CreateCategoryUseCase } from '@modules/content/application/use-cases/admin/create-category.usecase';
import { DeleteCategoryUseCase } from '@modules/content/application/use-cases/admin/delete-category.usecase';
import { ListAllCategoriesUseCase } from '@modules/content/application/use-cases/admin/list-all-categories.usecase';
import { UpdateCategoryUseCase } from '@modules/content/application/use-cases/admin/update-category.usecase';
import { BEARER_AUTH_NAME, TAGS } from '@docs/constants';
import { ApiStandardErrors } from '@docs/decorators/api-standard-errors.decorator';
import { AdminCategoryResponse } from '@docs/schemas/admin-response.schema';

const CATEGORY_ID_PARAM = {
  name: 'id',
  description: 'UUID of the target category.',
  example: '6d2a3f08-7a51-4f9c-9d6f-2e3b6c41e7ad',
  schema: { type: 'string', format: 'uuid' } as const,
};

@ApiTags(TAGS.AdminCategories)
@ApiBearerAuth(BEARER_AUTH_NAME)
@Controller('admin/categories')
@UseGuards(JwtAuthGuard, AdminGuard)
export class AdminCategoriesController {
  constructor(
    private readonly listAllCategoriesUseCase: ListAllCategoriesUseCase,
    private readonly createCategoryUseCase: CreateCategoryUseCase,
    private readonly updateCategoryUseCase: UpdateCategoryUseCase,
    private readonly deleteCategoryUseCase: DeleteCategoryUseCase,
  ) {}

  @Get()
  @ApiOperation({
    summary: 'List all categories (including inactive)',
    description:
      'Returns every category — active and inactive — sorted by `sortOrder` then `name`. Includes `itemCount`.',
  })
  @ApiOkResponse({
    description: 'All categories, sorted by sortOrder.',
    type: [AdminCategoryResponse],
  })
  @ApiStandardErrors({ unauthorized: true, forbidden: true })
  list() {
    return this.listAllCategoriesUseCase.execute();
  }

  @Post()
  @ApiOperation({
    summary: 'Create a category',
    description: 'Slug must be unique across all categories.',
  })
  @ApiBody({
    type: CreateCategoryDto,
    examples: {
      minimal: {
        summary: 'Required fields only',
        value: {
          name: 'Animals',
          slug: 'animals',
          coverImagePath: 'categories/animals/cover.webp',
        },
      },
      full: {
        summary: 'With color, sort order, and active flag',
        value: {
          name: 'Animals',
          slug: 'animals',
          coverImagePath: 'categories/animals/cover.webp',
          colorHex: '#7BAFD4',
          sortOrder: 10,
          isActive: true,
        },
      },
      draft: {
        summary: 'Created hidden (isActive=false)',
        value: {
          name: 'Sports',
          slug: 'sports',
          coverImagePath: 'categories/sports/cover.webp',
          colorHex: '#F2A65A',
          sortOrder: 50,
          isActive: false,
        },
      },
    },
  })
  @ApiCreatedResponse({
    description: 'Category created.',
    type: AdminCategoryResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    conflict: 'Slug already in use.',
  })
  create(@Body() data: CreateCategoryDto) {
    return this.createCategoryUseCase.execute(data);
  }

  @Patch(':id')
  @ApiOperation({
    summary: 'Update a category',
    description: 'Patch any subset of fields. Slug uniqueness is enforced.',
  })
  @ApiParam(CATEGORY_ID_PARAM)
  @ApiBody({
    type: UpdateCategoryDto,
    examples: {
      renameOnly: {
        summary: 'Rename only',
        value: { name: 'Wild Animals' },
      },
      hide: {
        summary: 'Hide from learners',
        value: { isActive: false },
      },
      reorder: {
        summary: 'Reorder',
        value: { sortOrder: 5 },
      },
      rebrand: {
        summary: 'Rebrand (new slug + color + cover)',
        value: {
          slug: 'wild-animals',
          colorHex: '#3F8E5C',
          coverImagePath: 'categories/wild-animals/cover.webp',
        },
      },
    },
  })
  @ApiOkResponse({
    description: 'Updated category.',
    type: AdminCategoryResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
    conflict: 'New slug already in use by another category.',
  })
  update(
    @Param('id', new ParseUUIDPipe()) id: string,
    @Body() data: UpdateCategoryDto,
  ) {
    return this.updateCategoryUseCase.execute(id, data);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiOperation({
    summary: 'Delete a category',
    description:
      'Blocks deletion (409 `CATEGORY_HAS_ITEMS`) when the category contains any learning items. ' +
      'Set `isActive=false` instead to hide it from learners without losing data.',
  })
  @ApiParam(CATEGORY_ID_PARAM)
  @ApiNoContentResponse({ description: 'Category deleted.' })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
    conflict: 'Category still contains items.',
  })
  remove(@Param('id', new ParseUUIDPipe()) id: string) {
    return this.deleteCategoryUseCase.execute(id);
  }
}
