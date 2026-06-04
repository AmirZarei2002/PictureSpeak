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
import { CreatePermissionDto } from '@modules/permission/application/dto/create-permission.dto';
import { UpdatePermissionDto } from '@modules/permission/application/dto/update-permission.dto';
import { CreatePermissionUseCase } from '@modules/permission/application/use-cases/create-permission.usecase';
import { DeletePermissionUseCase } from '@modules/permission/application/use-cases/delete-permission.usecase';
import { GetPermissionByIdUseCase } from '@modules/permission/application/use-cases/get-permission-by-id.usecase';
import { GetPermissionsUseCase } from '@modules/permission/application/use-cases/get-permissions.usecase';
import { UpdatePermissionUseCase } from '@modules/permission/application/use-cases/update-permission.usecase';

@Controller('admin/permissions')
@UseGuards(JwtAuthGuard, PermissionsGuard, AdminOnlyGuard)
export class AdminPermissionController {
  constructor(
    private readonly createPermissionUseCase: CreatePermissionUseCase,
    private readonly updatePermissionUseCase: UpdatePermissionUseCase,
    private readonly getPermissionsUseCase: GetPermissionsUseCase,
    private readonly getPermissionByIdUseCase: GetPermissionByIdUseCase,
    private readonly deletePermissionUseCase: DeletePermissionUseCase,
  ) {}

  @Post()
  @Permissions('permission:create')
  create(@Body() data: CreatePermissionDto) {
    return this.createPermissionUseCase.execute(data);
  }

  @Patch(':id')
  @Permissions('permission:update')
  update(@Param('id') id: string, @Body() data: UpdatePermissionDto) {
    return this.updatePermissionUseCase.execute(id, data);
  }

  @Get()
  @Permissions('permission:list')
  @UseInterceptors(CacheInterceptor)
  findAll(@Query() query: PaginationQueryDto) {
    return this.getPermissionsUseCase.execute(query);
  }

  @Get(':id')
  @Permissions('permission:read')
  findOne(@Param('id') id: string) {
    return this.getPermissionByIdUseCase.execute(id);
  }

  @Delete(':id')
  @Permissions('permission:delete')
  delete(@Param('id') id: string) {
    return this.deletePermissionUseCase.execute(id);
  }
}
