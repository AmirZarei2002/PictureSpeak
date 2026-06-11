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
  Query,
  UseGuards,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBody,
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
import { AdminGuard } from '@common/guards/admin.guard';
import { JwtAuthGuard } from '@common/guards/jwt-auth.guard';
import { ListUsersQueryDto } from '@modules/admin-user/application/dtos/list-users-query.dto';
import { AdminPaginationQueryDto } from '@modules/admin-user/application/dtos/pagination-query.dto';
import { UpdateUserAdminDto } from '@modules/admin-user/application/dtos/update-user-admin.dto';
import { DeleteUserUseCase } from '@modules/admin-user/application/use-cases/delete-user.usecase';
import { GetUserDetailUseCase } from '@modules/admin-user/application/use-cases/get-user-detail.usecase';
import { ListUserFavoritesUseCase } from '@modules/admin-user/application/use-cases/list-user-favorites.usecase';
import { ListUserProgressUseCase } from '@modules/admin-user/application/use-cases/list-user-progress.usecase';
import { ListUsersUseCase } from '@modules/admin-user/application/use-cases/list-users.usecase';
import { UpdateUserUseCase } from '@modules/admin-user/application/use-cases/update-user.usecase';
import { BEARER_AUTH_NAME, TAGS } from '@docs/constants';
import { ApiStandardErrors } from '@docs/decorators/api-standard-errors.decorator';
import {
  AdminUserDetailResponse,
  PaginatedAdminUsersResponse,
  PaginatedFavoritesResponse,
  PaginatedUserProgressResponse,
} from '@docs/schemas/admin-response.schema';

const USER_ID_PARAM = {
  name: 'id',
  description: 'UUID of the target user.',
  example: 'a3e1c7d2-9b8e-4c41-9b2c-5f72c8e0b6a4',
  schema: { type: 'string', format: 'uuid' } as const,
};

@ApiTags(TAGS.AdminUsers)
@ApiBearerAuth(BEARER_AUTH_NAME)
@Controller('admin/users')
@UseGuards(JwtAuthGuard, AdminGuard)
export class AdminUsersController {
  constructor(
    private readonly listUsersUseCase: ListUsersUseCase,
    private readonly getUserDetailUseCase: GetUserDetailUseCase,
    private readonly updateUserUseCase: UpdateUserUseCase,
    private readonly deleteUserUseCase: DeleteUserUseCase,
    private readonly listUserFavoritesUseCase: ListUserFavoritesUseCase,
    private readonly listUserProgressUseCase: ListUserProgressUseCase,
  ) {}

  @Get()
  @ApiOperation({
    summary: 'List users (paginated, filterable)',
    description:
      'Admin-only paginated user list. Filter by `role` (`USER` | `ADMIN`), guest status (`isGuest`), and substring `search` against email/displayName.',
  })
  @ApiOkResponse({
    description: 'Paginated list of users with engagement counts.',
    type: PaginatedAdminUsersResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
  })
  list(@Query() query: ListUsersQueryDto) {
    return this.listUsersUseCase.execute(query);
  }

  @Get(':id')
  @ApiOperation({ summary: 'Get a single user with engagement counts' })
  @ApiParam(USER_ID_PARAM)
  @ApiOkResponse({
    description: 'User detail with favorites/progress counts and lastSeenAt.',
    type: AdminUserDetailResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
  })
  detail(@Param('id', new ParseUUIDPipe()) id: string) {
    return this.getUserDetailUseCase.execute(id);
  }

  @Patch(':id')
  @ApiOperation({
    summary: 'Update a user (role, displayName)',
    description:
      'Patch a user. Blocks demoting the last remaining admin (409 `CANNOT_DEMOTE_LAST_ADMIN`).',
  })
  @ApiParam(USER_ID_PARAM)
  @ApiBody({
    type: UpdateUserAdminDto,
    examples: {
      promoteToAdmin: {
        summary: 'Promote to admin',
        value: { role: 'ADMIN' },
      },
      demoteToUser: {
        summary: 'Demote to user',
        value: { role: 'USER' },
      },
      renameDisplay: {
        summary: 'Rename display name',
        value: { displayName: 'Sara T.' },
      },
      both: {
        summary: 'Update role and display name together',
        value: { role: 'ADMIN', displayName: 'Sara T.' },
      },
    },
  })
  @ApiOkResponse({
    description: 'Updated user detail.',
    type: AdminUserDetailResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
    conflict: 'Demoting the last remaining admin is not allowed.',
  })
  update(
    @Param('id', new ParseUUIDPipe()) id: string,
    @Body() data: UpdateUserAdminDto,
  ) {
    return this.updateUserUseCase.execute(id, data);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  @ApiOperation({
    summary: 'Delete a user (hard delete, cascades favorites/progress)',
    description:
      'Hard-deletes the user and cascades to favorites and progress rows. ' +
      'Blocks self-deletion (400 `CANNOT_DELETE_SELF`) and deleting the last remaining admin (409 `CANNOT_DELETE_LAST_ADMIN`).',
  })
  @ApiParam(USER_ID_PARAM)
  @ApiNoContentResponse({ description: 'User deleted.' })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
    conflict: 'Deleting the last remaining admin is not allowed.',
  })
  remove(
    @CurrentUser() admin: AuthenticatedUser,
    @Param('id', new ParseUUIDPipe()) id: string,
  ) {
    return this.deleteUserUseCase.execute(admin.id, id);
  }

  @Get(':id/favorites')
  @ApiOperation({ summary: "List a user's favorites (paginated)" })
  @ApiParam(USER_ID_PARAM)
  @ApiOkResponse({
    description: 'Paginated favorites with category metadata.',
    type: PaginatedFavoritesResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
  })
  favorites(
    @Param('id', new ParseUUIDPipe()) id: string,
    @Query() query: AdminPaginationQueryDto,
  ) {
    return this.listUserFavoritesUseCase.execute(
      id,
      query.page ?? 1,
      query.size ?? 20,
    );
  }

  @Get(':id/progress')
  @ApiOperation({ summary: "List a user's progress rows (paginated)" })
  @ApiParam(USER_ID_PARAM)
  @ApiOkResponse({
    description: 'Paginated progress rows joined with item and category.',
    type: PaginatedUserProgressResponse,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
    notFound: true,
  })
  progress(
    @Param('id', new ParseUUIDPipe()) id: string,
    @Query() query: AdminPaginationQueryDto,
  ) {
    return this.listUserProgressUseCase.execute(
      id,
      query.page ?? 1,
      query.size ?? 20,
    );
  }
}
