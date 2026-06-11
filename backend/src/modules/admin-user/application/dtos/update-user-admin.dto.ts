import { ApiPropertyOptional } from '@nestjs/swagger';
import {
  IsEnum,
  IsOptional,
  IsString,
  MaxLength,
  MinLength,
} from 'class-validator';
import { Role } from '@prisma/client';

export class UpdateUserAdminDto {
  @ApiPropertyOptional({
    description:
      'New authorization role. Demoting the last remaining `ADMIN` is rejected with `409 CANNOT_DEMOTE_LAST_ADMIN`.',
    enum: Role,
    enumName: 'Role',
    example: Role.ADMIN,
  })
  @IsOptional()
  @IsEnum(Role)
  role?: Role;

  @ApiPropertyOptional({
    description: 'New display name, 1–50 characters.',
    minLength: 1,
    maxLength: 50,
    example: 'Sara T.',
  })
  @IsOptional()
  @IsString()
  @MinLength(1)
  @MaxLength(50)
  displayName?: string;
}
