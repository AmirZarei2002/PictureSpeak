import { ApiProperty } from '@nestjs/swagger';
import { Role, TextScale, ThemeMode } from '@prisma/client';

export class UserResponse {
  @ApiProperty({
    description: 'Server-generated unique identifier (UUID v4).',
    format: 'uuid',
    example: 'a3e1c7d2-9b8e-4c41-9b2c-5f72c8e0b6a4',
  })
  id!: string;

  @ApiProperty({
    description:
      'Verified email address. `null` for guest accounts that have not been upgraded.',
    format: 'email',
    nullable: true,
    example: 'sara.thompson@example.com',
  })
  email!: string | null;

  @ApiProperty({
    description:
      'True when the account was provisioned anonymously and has no credentials.',
    example: false,
  })
  isGuest!: boolean;

  @ApiProperty({
    description: 'Human-readable display name shown in the UI.',
    nullable: true,
    minLength: 1,
    maxLength: 50,
    example: 'Sara T.',
  })
  displayName!: string | null;

  @ApiProperty({
    description:
      'Authorization role. `ADMIN` unlocks the admin section; everyone else is `USER`.',
    enum: Role,
    enumName: 'Role',
    example: Role.USER,
  })
  role!: Role;

  @ApiProperty({
    description: 'Preferred text scale used by the mobile client.',
    enum: TextScale,
    enumName: 'TextScale',
    example: TextScale.normal,
  })
  textScale!: TextScale;

  @ApiProperty({
    description: 'Preferred color theme used by the mobile client.',
    enum: ThemeMode,
    enumName: 'ThemeMode',
    example: ThemeMode.system,
  })
  themeMode!: ThemeMode;

  @ApiProperty({
    description: 'Speech rate multiplier for text-to-speech playback.',
    minimum: 0.5,
    maximum: 2.0,
    example: 1.0,
  })
  speechRate!: number;

  @ApiProperty({
    description: 'Whether UI sound effects are enabled.',
    example: true,
  })
  soundEffectsOn!: boolean;

  @ApiProperty({
    description: 'ISO-8601 UTC timestamp of account creation.',
    format: 'date-time',
    example: '2026-04-12T08:14:55.000Z',
  })
  createdAt!: string;

  @ApiProperty({
    description: 'ISO-8601 UTC timestamp of the last account update.',
    format: 'date-time',
    example: '2026-06-08T11:02:00.000Z',
  })
  updatedAt!: string;
}

export class AuthResponse {
  @ApiProperty({
    description:
      'Signed JWT to be sent in the `Authorization: Bearer <token>` header. Default TTL is 30 days.',
    example:
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhM2UxYzdkMi05YjhlLTRjNDEtOWIyYy01ZjcyYzhlMGI2YTQiLCJpYXQiOjE3NDk0MDAwMDAsImV4cCI6MTc1MTk5MjAwMH0.7N1qz0sBp7C8x9d2j3K5l6M7n8O9p0Q1r2S3t4U5v6w',
  })
  accessToken!: string;

  @ApiProperty({
    description: 'The authenticated user profile.',
    type: UserResponse,
  })
  user!: UserResponse;
}
