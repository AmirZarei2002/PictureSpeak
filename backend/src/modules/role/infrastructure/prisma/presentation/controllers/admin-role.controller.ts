import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
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
import { AssignPermissionsToRoleDto } from '../../../../application/dto/assign-permissions-to-role.dto';
import { CreateRoleDto } from '../../../../application/dto/create-role.dto';
import { RevokePermissionsFromRoleDto } from '../../../../application/dto/revoke-permissions-from-role.dto';
import { UpdateRoleDto } from '../../../../application/dto/update-role.dto';
import { AssignPermissionsToRoleUseCase } from '../../../../application/use-cases/assign-permissions-to-role.usecase';
import { CreateRoleUseCase } from '../../../../application/use-cases/create-role.usecase';
import { DeleteRoleUseCase } from '../../../../application/use-cases/delete-role.usecase';
import { GetRoleByIdUseCase } from '../../../../application/use-cases/get-role-by-id.usecase';
import { GetRolesUseCase } from '../../../../application/use-cases/get-roles.usecase';
import { RevokePermissionsFromRoleUseCase } from '../../../../application/use-cases/revoke-permissions-from-role.usecase';
import { UpdateRoleUseCase } from '../../../../application/use-cases/update-role.usecase';

@Controller('admin/roles')
@UseGuards(JwtAuthGuard, PermissionsGuard, AdminOnlyGuard)
export class AdminRoleController {
  constructor(
    private readonly createRoleUseCase: CreateRoleUseCase,
    private readonly updateRoleUseCase: UpdateRoleUseCase,
    private readonly getRolesUseCase: GetRolesUseCase,
    private readonly getRoleByIdUseCase: GetRoleByIdUseCase,
    private readonly deleteRoleUseCase: DeleteRoleUseCase,
    private readonly assignPermissionsToRoleUseCase: AssignPermissionsToRoleUseCase,
    private readonly revokePermissionsFromRoleUseCase: RevokePermissionsFromRoleUseCase,
  ) {}

  @Post()
  @Permissions('role:create')
  create(@Body() data: CreateRoleDto) {
    return this.createRoleUseCase.execute(data);
  }

  @Patch(':id')
  @Permissions('role:update')
  update(@Param('id') id: string, @Body() data: UpdateRoleDto) {
    return this.updateRoleUseCase.execute(id, data);
  }

  @Get()
  @Permissions('role:list')
  @UseInterceptors(CacheInterceptor)
  findAll(@Query() query: PaginationQueryDto) {
    return this.getRolesUseCase.execute(query);
  }

  @Get(':id')
  @Permissions('role:read')
  findOne(@Param('id') id: string) {
    return this.getRoleByIdUseCase.execute(id);
  }

  @Delete(':id')
  @Permissions('role:delete')
  delete(@Param('id') id: string) {
    return this.deleteRoleUseCase.execute(id);
  }

  @Patch(':id/assign-permissions')
  @Permissions('role:assign-permissions')
  assignPermissions(
    @Param('id') id: string,
    @Body() data: AssignPermissionsToRoleDto,
  ) {
    return this.assignPermissionsToRoleUseCase.execute(id, data);
  }

  @Patch(':id/revoke-permissions')
  @Permissions('role:revoke-permissions')
  revokePermissions(
    @Param('id') id: string,
    @Body() data: RevokePermissionsFromRoleDto,
  ) {
    return this.revokePermissionsFromRoleUseCase.execute(id, data);
  }
}
