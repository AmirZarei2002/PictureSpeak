import { Module } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { GetUserByIdRepository } from '@modules/user/infrastructure/prisma/persistence/get-user-by-id.repository';
import { UpdateUserRepository } from '@modules/user/infrastructure/prisma/persistence/update-user.repository';
import { UserModule } from '@modules/user/user.module';
import { DeleteUserUseCase } from './application/use-cases/delete-user.usecase';
import { GetUserDetailUseCase } from './application/use-cases/get-user-detail.usecase';
import { ListUserProgressUseCase } from './application/use-cases/list-user-progress.usecase';
import { ListUsersUseCase } from './application/use-cases/list-users.usecase';
import { UpdateUserUseCase } from './application/use-cases/update-user.usecase';
import { CountAdminsRepository } from './infrastructure/prisma/persistence/count-admins.repository';
import { DeleteUserRepository } from './infrastructure/prisma/persistence/delete-user.repository';
import { GetUserDetailRepository } from './infrastructure/prisma/persistence/get-user-detail.repository';
import { ListUserProgressRepository } from './infrastructure/prisma/persistence/list-user-progress.repository';
import { ListUsersRepository } from './infrastructure/prisma/persistence/list-users.repository';
import { AdminUsersController } from './infrastructure/prisma/presentation/controllers/admin-users.controller';

@Module({
  imports: [UserModule],
  controllers: [AdminUsersController],
  providers: [
    PrismaService,

    ListUsersRepository,
    GetUserDetailRepository,
    DeleteUserRepository,
    CountAdminsRepository,
    ListUserProgressRepository,

    {
      provide: ListUsersUseCase,
      useFactory: (repo: ListUsersRepository) => new ListUsersUseCase(repo),
      inject: [ListUsersRepository],
    },
    {
      provide: GetUserDetailUseCase,
      useFactory: (repo: GetUserDetailRepository) =>
        new GetUserDetailUseCase(repo),
      inject: [GetUserDetailRepository],
    },
    {
      provide: UpdateUserUseCase,
      useFactory: (
        findRepo: GetUserByIdRepository,
        updateRepo: UpdateUserRepository,
        detailRepo: GetUserDetailRepository,
        countRepo: CountAdminsRepository,
      ) => new UpdateUserUseCase(findRepo, updateRepo, detailRepo, countRepo),
      inject: [
        GetUserByIdRepository,
        UpdateUserRepository,
        GetUserDetailRepository,
        CountAdminsRepository,
      ],
    },
    {
      provide: DeleteUserUseCase,
      useFactory: (
        findRepo: GetUserByIdRepository,
        deleteRepo: DeleteUserRepository,
        countRepo: CountAdminsRepository,
      ) => new DeleteUserUseCase(findRepo, deleteRepo, countRepo),
      inject: [
        GetUserByIdRepository,
        DeleteUserRepository,
        CountAdminsRepository,
      ],
    },
    {
      provide: ListUserProgressUseCase,
      useFactory: (
        findRepo: GetUserByIdRepository,
        progRepo: ListUserProgressRepository,
      ) => new ListUserProgressUseCase(findRepo, progRepo),
      inject: [GetUserByIdRepository, ListUserProgressRepository],
    },
  ],
})
export class AdminUserModule {}
