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
import { CreateItemDto } from '@modules/content/application/dtos/admin/create-item.dto';
import { UpdateItemDto } from '@modules/content/application/dtos/admin/update-item.dto';
import { CreateItemUseCase } from '@modules/content/application/use-cases/admin/create-item.usecase';
import { DeleteItemUseCase } from '@modules/content/application/use-cases/admin/delete-item.usecase';
import { ListItemsByCategoryIdUseCase } from '@modules/content/application/use-cases/admin/list-items-by-category-id.usecase';
import { UpdateItemUseCase } from '@modules/content/application/use-cases/admin/update-item.usecase';
import { BEARER_AUTH_NAME, TAGS } from '@docs/constants';
import { ApiStandardErrors } from '@docs/decorators/api-standard-errors.decorator';
import { AdminLearningItemResponse } from '@docs/schemas/admin-response.schema';

const CATEGORY_ID_PARAM = {
  name: 'categoryId',
  description: 'UUID of the parent category.',
  example: '6d2a3f08-7a51-4f9c-9d6f-2e3b6c41e7ad',
  schema: { type: 'string', format: 'uuid' } as const,
};

const ITEM_ID_PARAM = {
  name: 'id',
  description: 'UUID of the target learning item.',
  example: 'd1f8c2a0-3b45-4f6e-8a9b-0c1d2e3f4a5b',
  schema: { type: 'string', format: 'uuid' } as const,
};

@ApiTags(TAGS.AdminItems)
@ApiBearerAuth(BEARER_AUTH_NAME)
@Controller('admin')
@UseGuards(JwtAuthGuard, AdminGuard)
export class AdminItemsController {
  constructor(
    private readonly listItemsUseCase: ListItemsByCategoryIdUseCase,
    private readonly createItemUseCase: CreateItemUseCase,
    private readonly updateItemUseCase: UpdateItemUseCase,
    private readonly deleteItemUseCase: DeleteItemUseCase,
  ) {}

  @Get('categories/:categoryId/items')
  @ApiOperation({
    summary: 'List items in a category (including inactive)',
  })
  @ApiParam(CATEGORY_ID_PARAM)
  @ApiOkResponse({
    description: 'All items in the category, sorted by sortOrder.',
    type: [AdminLearningItemResponse],
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
  })
  list(@Param('categoryId', new ParseUUIDPipe()) categoryId: string) {
    return this.listItemsUseCase.execute(categoryId);
  }

  @Post('categories/:categoryId/items')
  @ApiOperation({
    summary: 'Create an item under a category',
    description: 'Slug must be unique within the parent category.',
  })
  @ApiParam(CATEGORY_ID_PARAM)
  @ApiBody({
    type: CreateItemDto,
    examples: {
      minimal: {
        summary: 'Required fields only',
        value: {
          name: 'Elephant',
          slug: 'elephant',
          imagePath: 'items/animals/elephant.webp',
        },
      },
      full: {
        summary: 'With thumbnail, audio, sort order, and active flag',
        value: {
          name: 'Elephant',
          slug: 'elephant',
          imagePath: 'items/animals/elephant.webp',
          thumbnailPath: 'items/animals/elephant.thumb.webp',
          audioPath: 'items/animals/elephant.mp3',
          sortOrder: 30,
          isActive: true,
        },
      },
      draft: {
        summary: 'Created hidden (isActive=false)',
        value: {
          name: 'Tiger',
          slug: 'tiger',
          imagePath: 'items/animals/tiger.webp',
          sortOrder: 40,
          isActive: false,
        },
      },
    },
  })
  @ApiCreatedResponse({
    description: 'Item created.',
    type: AdminLearningItemResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
    conflict: 'Slug already in use within this category.',
  })
  create(
    @Param('categoryId', new ParseUUIDPipe()) categoryId: string,
    @Body() data: CreateItemDto,
  ) {
    return this.createItemUseCase.execute(categoryId, data);
  }

  @Patch('items/:id')
  @ApiOperation({
    summary: 'Update an item',
    description:
      "Patch any subset of fields. Slug uniqueness is enforced within the item's category.",
  })
  @ApiParam(ITEM_ID_PARAM)
  @ApiBody({
    type: UpdateItemDto,
    examples: {
      renameOnly: {
        summary: 'Rename only',
        value: { name: 'African Elephant' },
      },
      attachAudio: {
        summary: 'Attach an audio clip',
        value: { audioPath: 'items/animals/elephant.mp3' },
      },
      clearAudio: {
        summary: 'Clear the audio clip',
        value: { audioPath: null },
      },
      hide: {
        summary: 'Hide from learners',
        value: { isActive: false },
      },
      reslug: {
        summary: 'Replace slug + image',
        value: {
          slug: 'african-elephant',
          imagePath: 'items/animals/african-elephant.webp',
          thumbnailPath: 'items/animals/african-elephant.thumb.webp',
        },
      },
    },
  })
  @ApiOkResponse({
    description: 'Updated item.',
    type: AdminLearningItemResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
    conflict: 'New slug already in use within this category.',
  })
  update(
    @Param('id', new ParseUUIDPipe()) id: string,
    @Body() data: UpdateItemDto,
  ) {
    return this.updateItemUseCase.execute(id, data);
  }

  @Delete('items/:id')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiOperation({
    summary: 'Delete an item (cascades favorites and progress)',
  })
  @ApiParam(ITEM_ID_PARAM)
  @ApiNoContentResponse({ description: 'Item deleted.' })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
  })
  remove(@Param('id', new ParseUUIDPipe()) id: string) {
    return this.deleteItemUseCase.execute(id);
  }
}
