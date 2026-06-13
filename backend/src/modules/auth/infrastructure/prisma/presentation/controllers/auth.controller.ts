import {
  Body,
  Controller,
  HttpCode,
  HttpStatus,
  Patch,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBody,
  ApiCreatedResponse,
  ApiNoContentResponse,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import { Request } from 'express';
import {
  AuthenticatedUser,
  CurrentUser,
} from '@common/decorators/current-user.decorator';
import { JwtAuthGuard } from '@common/guards/jwt-auth.guard';
import { LoginDto } from '@modules/auth/application/dtos/login.dto';
import { RegisterDto } from '@modules/auth/application/dtos/register.dto';
import { UpgradeGuestDto } from '@modules/auth/application/dtos/upgrade-guest.dto';
import { GuestUseCase } from '@modules/auth/application/use-cases/guest.usecase';
import { LoginUseCase } from '@modules/auth/application/use-cases/login.usecase';
import { LogoutUseCase } from '@modules/auth/application/use-cases/logout.usecase';
import { RegisterUseCase } from '@modules/auth/application/use-cases/register.usecase';
import { UpgradeGuestUseCase } from '@modules/auth/application/use-cases/upgrade-guest.usecase';
import { AuthResponse } from '@modules/auth/domain/types/auth.types';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { BEARER_AUTH_NAME, TAGS } from '@docs/constants';
import { ApiStandardErrors } from '@docs/decorators/api-standard-errors.decorator';
import { AuthResponse as AuthResponseSchema } from '@docs/schemas/user-response.schema';

function toAuthResponse({ user, accessToken }: AuthResponse) {
  return {
    accessToken,
    user: toUserResponse(user),
  };
}

function toUserResponse(user: UserEntity) {
  return {
    id: user.id,
    email: user.email,
    isGuest: user.isGuest,
    displayName: user.displayName,
    role: user.role,
    textScale: user.textScale,
    themeMode: user.themeMode,
    speechRate: user.speechRate,
    soundEffectsOn: user.soundEffectsOn,
    createdAt: user.createdAt,
    updatedAt: user.updatedAt,
  };
}

@ApiTags(TAGS.Authentication)
@Controller('auth')
export class AuthController {
  constructor(
    private readonly registerUseCase: RegisterUseCase,
    private readonly loginUseCase: LoginUseCase,
    private readonly guestUseCase: GuestUseCase,
    private readonly upgradeGuestUseCase: UpgradeGuestUseCase,
    private readonly logoutUseCase: LogoutUseCase,
  ) {}

  @Post('register')
  @HttpCode(HttpStatus.CREATED)
  @ApiOperation({
    summary: 'Register a new account',
    description:
      'Creates a new full (non-guest) account, hashes the password with bcrypt, and returns a signed JWT alongside the user profile. The email must be unique. After a successful response, persist the `accessToken` in secure storage on the client.',
  })
  @ApiBody({
    type: RegisterDto,
    examples: {
      minimal: {
        summary: 'Minimal payload',
        value: {
          email: 'sara.thompson@example.com',
          password: 'Sunset!2026',
        },
      },
      withDisplayName: {
        summary: 'With display name',
        value: {
          email: 'sara.thompson@example.com',
          password: 'Sunset!2026',
          displayName: 'Sara T.',
        },
      },
    },
  })
  @ApiCreatedResponse({
    description: 'Account created. Returns the access token and user profile.',
    type: AuthResponseSchema,
  })
  @ApiStandardErrors({ validation: true })
  async register(@Body() data: RegisterDto) {
    return toAuthResponse(await this.registerUseCase.execute(data));
  }

  @Post('login')
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    summary: 'Log in with email and password',
    description:
      'Verifies credentials against the bcrypt password hash and issues a new JWT. On failure, returns `401 Unauthorized` without revealing whether the email exists.',
  })
  @ApiBody({
    type: LoginDto,
    examples: {
      default: {
        summary: 'Standard login',
        value: {
          email: 'sara.thompson@example.com',
          password: 'Sunset!2026',
        },
      },
    },
  })
  @ApiOkResponse({
    description: 'Authentication succeeded.',
    type: AuthResponseSchema,
  })
  @ApiStandardErrors({ validation: true, unauthorized: true })
  async login(@Body() data: LoginDto) {
    return toAuthResponse(await this.loginUseCase.execute(data));
  }

  @Post('guest')
  @HttpCode(HttpStatus.CREATED)
  @ApiOperation({
    summary: 'Create an anonymous guest session',
    description:
      'Provisions an anonymous user with no credentials and returns a JWT. Guest accounts can record progress; calling `PATCH /auth/upgrade` later attaches an email and password without losing data.',
  })
  @ApiCreatedResponse({
    description: 'Guest account created.',
    type: AuthResponseSchema,
  })
  @ApiStandardErrors()
  async guest() {
    return toAuthResponse(await this.guestUseCase.execute());
  }

  @Patch('upgrade')
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth(BEARER_AUTH_NAME)
  @ApiOperation({
    summary: 'Upgrade the current guest to a full account',
    description:
      'Requires a valid guest JWT. Attaches an email and password to the existing account so the user keeps their progress history. Returns a fresh JWT reflecting the upgraded identity. Fails with `409 Conflict` if the email is already taken or the account is no longer a guest.',
  })
  @ApiBody({
    type: UpgradeGuestDto,
    examples: {
      default: {
        summary: 'Attach credentials to guest',
        value: {
          email: 'sara.thompson@example.com',
          password: 'Sunset!2026',
          displayName: 'Sara T.',
        },
      },
    },
  })
  @ApiOkResponse({
    description:
      'Guest upgraded. Returns a new token tied to the upgraded account.',
    type: AuthResponseSchema,
  })
  @ApiStandardErrors({
    validation: true,
    unauthorized: true,
    forbidden: true,
  })
  async upgrade(
    @CurrentUser() user: AuthenticatedUser,
    @Body() data: UpgradeGuestDto,
  ) {
    return toAuthResponse(
      await this.upgradeGuestUseCase.execute(user.id, data),
    );
  }

  @Post('logout')
  @HttpCode(HttpStatus.NO_CONTENT)
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth(BEARER_AUTH_NAME)
  @ApiOperation({
    summary: 'Log out the current session',
    description:
      'Invalidates the bearer token used on this request by adding it to a server-side blacklist until its natural expiry. Subsequent requests presenting the same token will receive `401 Unauthorized`. Clients should also discard the token from local storage.',
  })
  @ApiNoContentResponse({
    description: 'The token was accepted and invalidated. No content is returned.',
  })
  @ApiStandardErrors({ unauthorized: true })
  async logout(@Req() request: Request): Promise<void> {
    const header = request.headers.authorization ?? '';
    const token = header.startsWith('Bearer ') ? header.slice(7) : '';
    if (token) {
      await this.logoutUseCase.execute(token);
    }
  }
}
