import { Body, Controller, Get, Patch, UseGuards } from '@nestjs/common';
import {
  ApiBearerAuth,
  ApiBody,
  ApiOkResponse,
  ApiOperation,
  ApiTags,
} from '@nestjs/swagger';
import {
  AuthenticatedUser,
  CurrentUser,
} from '@common/decorators/current-user.decorator';
import { JwtAuthGuard } from '@common/guards/jwt-auth.guard';
import { UpdatePreferencesDto } from '@modules/user/application/dtos/update-preferences.dto';
import { GetMeUseCase } from '@modules/user/application/use-cases/get-me.usecase';
import { UpdateMeUseCase } from '@modules/user/application/use-cases/update-me.usecase';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { BEARER_AUTH_NAME, TAGS } from '@docs/constants';
import { ApiStandardErrors } from '@docs/decorators/api-standard-errors.decorator';
import { UserResponse } from '@docs/schemas/user-response.schema';

function toMeResponse(user: UserEntity) {
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

@ApiTags(TAGS.Account)
@ApiBearerAuth(BEARER_AUTH_NAME)
@Controller('me')
@UseGuards(JwtAuthGuard)
export class MeController {
  constructor(
    private readonly getMeUseCase: GetMeUseCase,
    private readonly updateMeUseCase: UpdateMeUseCase,
  ) {}

  @Get()
  @ApiOperation({
    summary: 'Get the current user profile',
    description:
      'Returns the profile of the currently-authenticated user, including UI preferences. Safe to call on every app launch — the response is small and reflects the latest server state.',
  })
  @ApiOkResponse({
    description: 'The authenticated user profile.',
    type: UserResponse,
  })
  @ApiStandardErrors({ unauthorized: true })
  async findMe(@CurrentUser() user: AuthenticatedUser) {
    const me = await this.getMeUseCase.execute(user.id);
    return toMeResponse(me);
  }

  @Patch()
  @ApiOperation({
    summary: 'Update the current user profile',
    description:
      'Partially updates the authenticated user. Only the fields present in the body are written; omitted fields are left untouched. Returns the full, updated profile so clients can replace their local copy without re-fetching.',
  })
  @ApiBody({
    type: UpdatePreferencesDto,
    examples: {
      themeOnly: {
        summary: 'Switch to dark mode',
        value: { themeMode: 'dark' },
      },
      readingMode: {
        summary: 'Bigger text + faster narration',
        value: { textScale: 'xlarge', speechRate: 1.5 },
      },
      renameDisplay: {
        summary: 'Rename display name',
        value: { displayName: 'Sara T.' },
      },
      muteSounds: {
        summary: 'Mute UI sound effects',
        value: { soundEffectsOn: false },
      },
    },
  })
  @ApiOkResponse({
    description: 'Profile updated successfully.',
    type: UserResponse,
  })
  @ApiStandardErrors({ validation: true, unauthorized: true })
  async updateMe(
    @CurrentUser() user: AuthenticatedUser,
    @Body() data: UpdatePreferencesDto,
  ) {
    const me = await this.updateMeUseCase.execute(user.id, data);
    return toMeResponse(me);
  }
}
