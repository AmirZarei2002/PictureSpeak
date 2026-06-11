import { ApiProperty } from '@nestjs/swagger';
import { IsOptional, IsString, Length } from 'class-validator';
import { i18nValidationMessage } from 'nestjs-i18n';
import { IsEmail } from '@common/decorators/is-email.decorator';
import { IsStrongPassword } from '@common/decorators/is-strong-password.decorator';

export class RegisterDto {
  @ApiProperty({
    description:
      'Email address for the new account. Must be unique across the platform.',
    format: 'email',
    example: 'sara.thompson@example.com',
  })
  @IsEmail()
  email: string;

  @ApiProperty({
    description:
      'Account password. Must be at least 8 characters and contain at least one uppercase letter, one lowercase letter, one digit, and one special character from `@$!%*?&`.',
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
      'Optional display name shown in the UI. Trimmed to 50 characters.',
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
