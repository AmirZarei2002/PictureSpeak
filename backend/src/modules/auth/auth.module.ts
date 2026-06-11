import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { JwtModule, JwtService } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { IsEmailConstraint } from '@common/validators/is-email.validator';
import { IsStrongPasswordConstraint } from '@common/validators/is-strong-password.validator';
import { PasswordService } from '@shared/services/password.service';
import {
  ICreateUserRepository,
  IFindUserByEmailRepository,
  IFindUserByIdRepository,
  IUpdateUserRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';
import { CreateUserRepository } from '@modules/user/infrastructure/prisma/persistence/create-user.repository';
import { GetUserByEmailRepository } from '@modules/user/infrastructure/prisma/persistence/get-user-by-email.repository';
import { GetUserByIdRepository } from '@modules/user/infrastructure/prisma/persistence/get-user-by-id.repository';
import { UpdateUserRepository } from '@modules/user/infrastructure/prisma/persistence/update-user.repository';
import { UserModule } from '@modules/user/user.module';
import { GuestUseCase } from './application/use-cases/guest.usecase';
import { LoginUseCase } from './application/use-cases/login.usecase';
import { LogoutUseCase } from './application/use-cases/logout.usecase';
import { RegisterUseCase } from './application/use-cases/register.usecase';
import { UpgradeGuestUseCase } from './application/use-cases/upgrade-guest.usecase';
import { JwtStrategy } from './infrastructure/passport/jwt.strategy';
import { AuthController } from './infrastructure/prisma/presentation/controllers/auth.controller';
import { TokenBlacklistService } from './infrastructure/services/token-blacklist.service';

@Module({
  imports: [
    UserModule,
    PassportModule.register({ defaultStrategy: 'jwt' }),
    JwtModule.registerAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => ({
        secret: configService.getOrThrow<string>('JWT_SECRET'),
        signOptions: {
          expiresIn: configService.get<string>(
            'JWT_EXPIRES_IN',
            '30d',
          ) as unknown as number,
        },
      }),
    }),
  ],
  controllers: [AuthController],
  providers: [
    IsEmailConstraint,
    IsStrongPasswordConstraint,
    PasswordService,
    JwtStrategy,
    TokenBlacklistService,

    {
      provide: LogoutUseCase,
      useFactory: (
        jwtService: JwtService,
        tokenBlacklist: TokenBlacklistService,
      ) => new LogoutUseCase(jwtService, tokenBlacklist),
      inject: [JwtService, TokenBlacklistService],
    },

    {
      provide: RegisterUseCase,
      useFactory: (
        findUserByEmailRepo: IFindUserByEmailRepository,
        createUserRepo: ICreateUserRepository,
        passwordService: PasswordService,
        jwtService: JwtService,
      ) =>
        new RegisterUseCase(
          findUserByEmailRepo,
          createUserRepo,
          passwordService,
          jwtService,
        ),
      inject: [
        GetUserByEmailRepository,
        CreateUserRepository,
        PasswordService,
        JwtService,
      ],
    },
    {
      provide: LoginUseCase,
      useFactory: (
        findUserByEmailRepo: IFindUserByEmailRepository,
        passwordService: PasswordService,
        jwtService: JwtService,
      ) => new LoginUseCase(findUserByEmailRepo, passwordService, jwtService),
      inject: [GetUserByEmailRepository, PasswordService, JwtService],
    },
    {
      provide: GuestUseCase,
      useFactory: (
        createUserRepo: ICreateUserRepository,
        jwtService: JwtService,
      ) => new GuestUseCase(createUserRepo, jwtService),
      inject: [CreateUserRepository, JwtService],
    },
    {
      provide: UpgradeGuestUseCase,
      useFactory: (
        findUserByIdRepo: IFindUserByIdRepository,
        findUserByEmailRepo: IFindUserByEmailRepository,
        updateUserRepo: IUpdateUserRepository,
        passwordService: PasswordService,
        jwtService: JwtService,
      ) =>
        new UpgradeGuestUseCase(
          findUserByIdRepo,
          findUserByEmailRepo,
          updateUserRepo,
          passwordService,
          jwtService,
        ),
      inject: [
        GetUserByIdRepository,
        GetUserByEmailRepository,
        UpdateUserRepository,
        PasswordService,
        JwtService,
      ],
    },
  ],
})
export class AuthModule {}
