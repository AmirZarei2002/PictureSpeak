import { ApiProperty } from '@nestjs/swagger';
import { IsOptional, IsString, Length } from 'class-validator';
import { i18nValidationMessage } from 'nestjs-i18n';
import { IsEmail } from '@common/decorators/is-email.decorator';
import { IsStrongPassword } from '@common/decorators/is-strong-password.decorator';

export class UpgradeGuestDto {
  @ApiProperty({
    description:
      'Email address to attach to the currently-authenticated guest account. Must not already be in use.',
    format: 'email',
    example: 'sara.thompson@example.com',
  })
  @IsEmail()
  email: string;

  @ApiProperty({
    description:
      'Password to set on the upgraded account. Same rules as `POST /auth/register`.',
    format: 'password',
    minLength: 8,
    pattern:
      '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$',
    example: 'Sunset!2026',
  })
  @IsStrongPassword()
  password: string;

  @ApiProperty({
    description:
      'Optional display name. If omitted, the existing guest `displayName` is preserved.',
    required: false,
    nullable: true,
    minLength: 1,
    maxLength: 50,
    example: 'Sara T.',
  })
  @IsOptional()
  @IsString({ message: i18nValidationMessage('validation.IS_STRING') })
  @Length(1, 50, { message: i18nValidationMessage('validation.LENGTH') })
  displayName?: string;
}
