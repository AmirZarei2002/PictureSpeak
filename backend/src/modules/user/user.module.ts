import { Module } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { GetMeUseCase } from './application/use-cases/get-me.usecase';
import { UpdateMeUseCase } from './application/use-cases/update-me.usecase';
import {
  IFindUserByIdRepository,
  IUpdateUserRepository,
} from './domain/interfaces/user.repository.interface';
import { CreateUserRepository } from './infrastructure/prisma/persistence/create-user.repository';
import { GetUserByEmailRepository } from './infrastructure/prisma/persistence/get-user-by-email.repository';
import { GetUserByIdRepository } from './infrastructure/prisma/persistence/get-user-by-id.repository';
import { UpdateUserRepository } from './infrastructure/prisma/persistence/update-user.repository';
import { MeController } from './infrastructure/prisma/presentation/controllers/me.controller';

@Module({
  exports: [
    CreateUserRepository,
    GetUserByEmailRepository,
    GetUserByIdRepository,
    UpdateUserRepository,
  ],
  controllers: [MeController],
  providers: [
    PrismaService,

    CreateUserRepository,
    GetUserByEmailRepository,
    GetUserByIdRepository,
    UpdateUserRepository,

    {
      provide: GetMeUseCase,
      useFactory: (findUserByIdRepo: IFindUserByIdRepository) =>
        new GetMeUseCase(findUserByIdRepo),
      inject: [GetUserByIdRepository],
    },
    {
      provide: UpdateMeUseCase,
      useFactory: (
        updateUserRepo: IUpdateUserRepository,
        findUserByIdRepo: IFindUserByIdRepository,
      ) => new UpdateMeUseCase(updateUserRepo, findUserByIdRepo),
      inject: [UpdateUserRepository, GetUserByIdRepository],
    },
  ],
})
export class UserModule {}
