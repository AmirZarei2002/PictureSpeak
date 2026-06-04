import {
  Body,
  Controller,
  Get,
  Param,
  Patch,
  Query,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import { Permissions } from '@common/decorators/permissions.decorator';
import { PaginationQueryDto } from '@common/dtos/pagination-query.dto';
import { AdminOnlyGuard } from '@common/guards/admin-only.guard';
import { JwtAuthGuard } from '@common/guards/jwt-auth.guard';
import { PermissionsGuard } from '@common/guards/permissions.guard';
import { CacheInterceptor } from '@shared/cache/cache.interceptor';
import { AssignRoleToUserDto } from '@modules/user/application/dto/assign-role-to-user.dto';
import { AssignRoleToUserUseCase } from '@modules/user/application/use-cases/assign-role-to-user.usecase';
import { GetUserByIdUseCase } from '@modules/user/application/use-cases/get-user-by-id.usecase';
import { GetUsersUseCase } from '@modules/user/application/use-cases/get-users.usecase';
import { RevokeRoleFromUserUseCase } from '@modules/user/application/use-cases/revoke-role-from-user.usecase';

@Controller('admin/users')
@UseGuards(JwtAuthGuard, PermissionsGuard, AdminOnlyGuard)
export class AdminUserController {
  constructor(
    private readonly getUsersUseCase: GetUsersUseCase,
    private readonly getUserByIdUseCase: GetUserByIdUseCase,
    private readonly assignRoleToUserUseCase: AssignRoleToUserUseCase,
    private readonly revokeRoleFromUserUseCase: RevokeRoleFromUserUseCase,
  ) {}

  @Get()
  @Permissions('user:list')
  @UseInterceptors(CacheInterceptor)
  findAll(@Query() query: PaginationQueryDto) {
    return this.getUsersUseCase.execute(query);
  }

  @Get(':id')
  @Permissions('user:read')
  findOne(@Param('id') id: string) {
    return this.getUserByIdUseCase.execute(id);
  }

  @Patch(':id/assign-role')
  @Permissions('user:assign-role')
  assignRole(@Param('id') id: string, @Body() data: AssignRoleToUserDto) {
    return this.assignRoleToUserUseCase.execute(id, data);
  }

  @Patch(':id/revoke-role')
  @Permissions('user:revoke-role')
  revokeRole(@Param('id') id: string) {
    return this.revokeRoleFromUserUseCase.execute(id);
  }
}
