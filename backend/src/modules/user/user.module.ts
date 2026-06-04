import { Module } from '@nestjs/common';
import { IsEmailConstraint } from '@common/validators/is-email.validator';
import { IsStrongPasswordConstraint } from '@common/validators/is-strong-password.validator';
import { CustomCacheModule } from '@shared/cache/cache.module';
import { PasswordService } from '@shared/services/password.service';
import { PrismaService } from '@prisma/prisma.service';
// Use Cases
import { UserProvisionService } from './application/services/user-provision.service';
import { AssignRoleToUserUseCase } from './application/use-cases/assign-role-to-user.usecase';
import { CreateUserUseCase } from './application/use-cases/create-user.usecase';
import { GetUserByIdUseCase } from './application/use-cases/get-user-by-id.usecase';
import { GetUsersUseCase } from './application/use-cases/get-users.usecase';
import { RevokeRoleFromUserUseCase } from './application/use-cases/revoke-role-from-user.usecase';
// Repositories
import {
  IAssignRoleRepository,
  ICreateUserRepository,
  IFindUserByEmailRepository,
  IFindUserByIdRepository,
  IFindUsersRepository,
  IRevokeRoleRepository,
} from './domain/interfaces/user.repository.interface';
import { AssignRoleToUserRepository } from './infrastructure/prisma/persistence/assign-role-to-user.repository';
import { CreateUserRepository } from './infrastructure/prisma/persistence/create-user.repository';
import { GetUserByEmailRepository } from './infrastructure/prisma/persistence/get-user-by-email.repository';
import { GetUserByIdRepository } from './infrastructure/prisma/persistence/get-user-by-id.repository';
import { GetUsersRepository } from './infrastructure/prisma/persistence/get-users.repository';
import { RevokeUserRoleRepository } from './infrastructure/prisma/persistence/revoke-role-from-user.repository';
// Controller
import { AdminUserController } from './infrastructure/prisma/presentation/controllers/admin-user.controller';

@Module({
  imports: [CustomCacheModule],
  exports: [
    GetUserByIdRepository,
    GetUserByEmailRepository,
    UserProvisionService,
  ],
  controllers: [AdminUserController],
  providers: [
    PrismaService,
    IsStrongPasswordConstraint,
    IsEmailConstraint,
    PasswordService,

    // Repositories
    CreateUserRepository,
    GetUsersRepository,
    GetUserByIdRepository,
    AssignRoleToUserRepository,
    RevokeUserRoleRepository,
    GetUserByEmailRepository,

    // Services
    UserProvisionService,

    // Use Cases
    {
      provide: CreateUserUseCase,
      useFactory: (
        createUserRepo: ICreateUserRepository,
        passwordService: PasswordService,
      ) => new CreateUserUseCase(createUserRepo, passwordService),
      inject: [CreateUserRepository, PasswordService],
    },
    {
      provide: GetUsersUseCase,
      useFactory: (findAllUsersRepo: IFindUsersRepository) =>
        new GetUsersUseCase(findAllUsersRepo),
      inject: [GetUsersRepository],
    },
    {
      provide: GetUserByIdUseCase,
      useFactory: (findOneUserRepo: IFindUserByIdRepository) =>
        new GetUserByIdUseCase(findOneUserRepo),
      inject: [GetUserByIdRepository],
    },
    {
      provide: AssignRoleToUserUseCase,
      useFactory: (
        assignRoleRepo: IAssignRoleRepository,
        findOneUserRepo: IFindUserByIdRepository,
      ) => new AssignRoleToUserUseCase(assignRoleRepo, findOneUserRepo),
      inject: [AssignRoleToUserRepository, GetUserByIdRepository],
    },
    {
      provide: RevokeRoleFromUserUseCase,
      useFactory: (
        revokeRoleRepo: IRevokeRoleRepository,
        findOneUserRepo: IFindUserByIdRepository,
      ) => new RevokeRoleFromUserUseCase(revokeRoleRepo, findOneUserRepo),
      inject: [RevokeUserRoleRepository, GetUserByIdRepository],
    },
    {
      provide: UserProvisionService,
      useFactory: (
        findUserByEmailRepo: IFindUserByEmailRepository,
        createUserRepo: ICreateUserRepository,
        prisma: PrismaService,
      ) =>
        new UserProvisionService(findUserByEmailRepo, createUserRepo, prisma),
      inject: [GetUserByEmailRepository, CreateUserRepository, PrismaService],
    },
  ],
})
export class UserModule {}
