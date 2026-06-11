import {
  Controller,
  Delete,
  Get,
  HttpCode,
  HttpStatus,
  Param,
  ParseUUIDPipe,
  Put,
  UseGuards,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiNoContentResponse,
  ApiOkResponse,
  ApiOperation,
  ApiParam,
  ApiTags,
} from '@nestjs/swagger';
import {
  AuthenticatedUser,
  CurrentUser,
} from '@common/decorators/current-user.decorator';
import { JwtAuthGuard } from '@common/guards/jwt-auth.guard';
import { AddFavoriteUseCase } from '@modules/favorites/application/use-cases/add-favorite.usecase';
import { GetFavoritesUseCase } from '@modules/favorites/application/use-cases/get-favorites.usecase';
import { RemoveFavoriteUseCase } from '@modules/favorites/application/use-cases/remove-favorite.usecase';
import { BEARER_AUTH_NAME, TAGS } from '@docs/constants';
import { ApiStandardErrors } from '@docs/decorators/api-standard-errors.decorator';
import { FavoriteItemResponse } from '@docs/schemas/favorites-response.schema';

const ITEM_ID_PARAM = {
  name: 'itemId',
  description: 'UUID of the target learning item.',
  example: 'd1f8c2a0-3b45-4f6e-8a9b-0c1d2e3f4a5b',
  schema: { type: 'string', format: 'uuid' } as const,
};

@ApiTags(TAGS.Favorites)
@ApiBearerAuth(BEARER_AUTH_NAME)
@Controller('favorites')
@UseGuards(JwtAuthGuard)
export class FavoritesController {
  constructor(
    private readonly getFavoritesUseCase: GetFavoritesUseCase,
    private readonly addFavoriteUseCase: AddFavoriteUseCase,
    private readonly removeFavoriteUseCase: RemoveFavoriteUseCase,
  ) {}

  @Get()
  @ApiOperation({
    summary: 'List the current user’s favorite items',
    description:
      'Returns every learning item the authenticated user has favorited, including category metadata so the client can render the list without additional lookups. Sorted by `favoritedAt` descending (newest first).',
  })
  @ApiOkResponse({
    description: 'List of favorited items with category metadata.',
    type: [FavoriteItemResponse],
  })
  @ApiStandardErrors({ unauthorized: true })
  findAll(@CurrentUser() user: AuthenticatedUser) {
    return this.getFavoritesUseCase.execute(user.id);
  }

  @Put(':itemId')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiOperation({
    summary: 'Mark an item as favorite (idempotent)',
    description:
      'Adds the specified learning item to the current user’s favorites. Idempotent: repeated calls with the same `itemId` return `204` without raising an error.',
  })
  @ApiParam(ITEM_ID_PARAM)
  @ApiNoContentResponse({
    description:
      'Item is now favorited (whether it was newly added or already a favorite).',
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    notFound: 'No learning item exists with the provided `itemId`.',
  })
  add(
    @CurrentUser() user: AuthenticatedUser,
    @Param('itemId', new ParseUUIDPipe()) itemId: string,
  ) {
    return this.addFavoriteUseCase.execute(user.id, itemId);
  }

  @Delete(':itemId')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiOperation({
    summary: 'Remove an item from favorites (idempotent)',
    description:
      'Removes the specified learning item from the current user’s favorites. Idempotent: returns `204` even if the item was not favorited.',
  })
  @ApiParam(ITEM_ID_PARAM)
  @ApiNoContentResponse({
    description: 'Item is no longer in the user’s favorites.',
  })
  @ApiStandardErrors({ validation: true, unauthorized: true })
  remove(
    @CurrentUser() user: AuthenticatedUser,
    @Param('itemId', new ParseUUIDPipe()) itemId: string,
  ) {
    return this.removeFavoriteUseCase.execute(user.id, itemId);
  }
}
