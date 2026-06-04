import { Module } from '@nestjs/common';
import { CustomCacheModule } from '@shared/cache/cache.module';
import { PrismaService } from '@prisma/prisma.service';
// Use Cases
import { CreatePermissionUseCase } from './application/use-cases/create-permission.usecase';
import { DeletePermissionUseCase } from './application/use-cases/delete-permission.usecase';
import { GetPermissionByIdUseCase } from './application/use-cases/get-permission-by-id.usecase';
import { GetPermissionsUseCase } from './application/use-cases/get-permissions.usecase';
import { UpdatePermissionUseCase } from './application/use-cases/update-permission.usecase';
// Repositories
import {
  ICreatePermissionRepository,
  IDeletePermissionRepository,
  IFindPermissionByIdRepository,
  IFindPermissionsRepository,
  IUpdatePermissionRepository,
} from './domain/interfaces/permission.repository.interface';
import { CreatePermissionsRepository } from './infrastructure/prisma/persistence/create-permission.repository';
import { DeletePermissionRepository } from './infrastructure/prisma/persistence/delete-permission.repository';
import { GetPermissionByIdRepository } from './infrastructure/prisma/persistence/get-permission-by-id.repository';
import { GetPermissionsRepository } from './infrastructure/prisma/persistence/get-permissions.repository';
import { UpdatePermissionRepository } from './infrastructure/prisma/persistence/update-permission.repository';
// Controller
import { AdminPermissionController } from './infrastructure/prisma/presentation/controllers/admin-permission.controller';

@Module({
  imports: [CustomCacheModule],
  controllers: [AdminPermissionController],
  providers: [
    PrismaService,

    // Repositories
    CreatePermissionsRepository,
    UpdatePermissionRepository,
    GetPermissionsRepository,
    GetPermissionByIdRepository,
    DeletePermissionRepository,

    // Use Cases
    {
      provide: CreatePermissionUseCase,
      useFactory: (createPermissionRepo: ICreatePermissionRepository) =>
        new CreatePermissionUseCase(createPermissionRepo),
      inject: [CreatePermissionsRepository],
    },
    {
      provide: UpdatePermissionUseCase,
      useFactory: (
        updatePermissionRepo: IUpdatePermissionRepository,
        findOnePermissionRepo: IFindPermissionByIdRepository,
      ) =>
        new UpdatePermissionUseCase(
          updatePermissionRepo,
          findOnePermissionRepo,
        ),
      inject: [UpdatePermissionRepository, GetPermissionByIdRepository],
    },
    {
      provide: GetPermissionsUseCase,
      useFactory: (findAllPermissionsRepo: IFindPermissionsRepository) =>
        new GetPermissionsUseCase(findAllPermissionsRepo),
      inject: [GetPermissionsRepository],
    },
    {
      provide: GetPermissionByIdUseCase,
      useFactory: (findOnePermissionRepo: IFindPermissionByIdRepository) =>
        new GetPermissionByIdUseCase(findOnePermissionRepo),
      inject: [GetPermissionByIdRepository],
    },
    {
      provide: DeletePermissionUseCase,
      useFactory: (
        deletePermissionRepo: IDeletePermissionRepository,
        findOnePermissionRepo: IFindPermissionByIdRepository,
      ) =>
        new DeletePermissionUseCase(
          deletePermissionRepo,
          findOnePermissionRepo,
        ),
      inject: [DeletePermissionRepository, GetPermissionByIdRepository],
    },
  ],
})
export class PermissionModule {}
