import { Module } from '@nestjs/common';
import { CustomCacheModule } from '@shared/cache/cache.module';
import { PrismaService } from '@prisma/prisma.service';
// Use Cases
import { AssignPermissionsToRoleUseCase } from './application/use-cases/assign-permissions-to-role.usecase';
import { CreateRoleUseCase } from './application/use-cases/create-role.usecase';
import { DeleteRoleUseCase } from './application/use-cases/delete-role.usecase';
import { GetRoleByIdUseCase } from './application/use-cases/get-role-by-id.usecase';
import { GetRolesUseCase } from './application/use-cases/get-roles.usecase';
import { RevokePermissionsFromRoleUseCase } from './application/use-cases/revoke-permissions-from-role.usecase';
import { UpdateRoleUseCase } from './application/use-cases/update-role.usecase';
// Repositories
import {
  IAssignPermissionsRepository,
  ICreateRoleRepository,
  IDeleteRoleRepository,
  IFindRoleByIdRepository,
  IFindRolesRepository,
  IRevokePermissionsRepository,
  IUpdateRoleRepository,
} from './domain/interfaces/role.repository.interface';
import { AssignPermissionsToRoleRepository } from './infrastructure/prisma/persistence/assign-permissions-to-role.repository';
import { CreateRoleRepository } from './infrastructure/prisma/persistence/create-role.repository';
import { DeleteRoleRepository } from './infrastructure/prisma/persistence/delete-role.repository';
import { GetRoleByIdRepository } from './infrastructure/prisma/persistence/get-role-by-id.repository';
import { GetRolesRepository } from './infrastructure/prisma/persistence/get-roles.repository';
import { RevokePermissionsFromRoleRepository } from './infrastructure/prisma/persistence/revoke-permissions-from-role.repository';
import { UpdateRoleRepository } from './infrastructure/prisma/persistence/update-role.repository';
// Controller
import { AdminRoleController } from './infrastructure/prisma/presentation/controllers/admin-role.controller';

@Module({
  imports: [CustomCacheModule],
  controllers: [AdminRoleController],
  providers: [
    PrismaService,

    // Repositories
    CreateRoleRepository,
    UpdateRoleRepository,
    GetRolesRepository,
    GetRoleByIdRepository,
    DeleteRoleRepository,
    AssignPermissionsToRoleRepository,
    RevokePermissionsFromRoleRepository,

    // Use Cases
    {
      provide: CreateRoleUseCase,
      useFactory: (createRoleRepo: ICreateRoleRepository) =>
        new CreateRoleUseCase(createRoleRepo),
      inject: [CreateRoleRepository],
    },
    {
      provide: UpdateRoleUseCase,
      useFactory: (
        updateRoleRepo: IUpdateRoleRepository,
        findOneRoleRepo: IFindRoleByIdRepository,
      ) => new UpdateRoleUseCase(updateRoleRepo, findOneRoleRepo),
      inject: [UpdateRoleRepository, GetRoleByIdRepository],
    },
    {
      provide: GetRolesUseCase,
      useFactory: (findAllRolesRepo: IFindRolesRepository) =>
        new GetRolesUseCase(findAllRolesRepo),
      inject: [GetRolesRepository],
    },
    {
      provide: GetRoleByIdUseCase,
      useFactory: (findOneRoleRepo: IFindRoleByIdRepository) =>
        new GetRoleByIdUseCase(findOneRoleRepo),
      inject: [GetRoleByIdRepository],
    },
    {
      provide: DeleteRoleUseCase,
      useFactory: (
        deleteRoleRepo: IDeleteRoleRepository,
        findOneRoleRepo: IFindRoleByIdRepository,
      ) => new DeleteRoleUseCase(deleteRoleRepo, findOneRoleRepo),
      inject: [DeleteRoleRepository, GetRoleByIdRepository],
    },
    {
      provide: AssignPermissionsToRoleUseCase,
      useFactory: (
        assignPermissionsRepo: IAssignPermissionsRepository,
        findOneRoleRepo: IFindRoleByIdRepository,
      ) =>
        new AssignPermissionsToRoleUseCase(
          assignPermissionsRepo,
          findOneRoleRepo,
        ),
      inject: [AssignPermissionsToRoleRepository, GetRoleByIdRepository],
    },
    {
      provide: RevokePermissionsFromRoleUseCase,
      useFactory: (
        revokePermissionsRepo: IRevokePermissionsRepository,
        findOneRoleRepo: IFindRoleByIdRepository,
      ) =>
        new RevokePermissionsFromRoleUseCase(
          revokePermissionsRepo,
          findOneRoleRepo,
        ),
      inject: [RevokePermissionsFromRoleRepository, GetRoleByIdRepository],
    },
  ],
})
export class RoleModule {}
