import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsString } from 'class-validator';
import { i18nValidationMessage } from 'nestjs-i18n';
import { IsEmail } from '@common/decorators/is-email.decorator';

export class LoginDto {
  @ApiProperty({
    description: 'Email address associated with the account.',
    format: 'email',
    example: 'sara.thompson@example.com',
  })
  @IsEmail()
  email: string;

  @ApiProperty({
    description: 'Account password. Never logged server-side.',
    format: 'password',
    minLength: 8,
    example: 'Sunset!2026',
  })
  @IsString({ message: i18nValidationMessage('validation.IS_STRING') })
  @IsNotEmpty({ message: i18nValidationMessage('validation.IS_NOT_EMPTY') })
  password: string;
}
