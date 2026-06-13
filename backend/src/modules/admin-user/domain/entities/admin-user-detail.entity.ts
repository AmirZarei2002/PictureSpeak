import { Role, TextScale, ThemeMode } from '@prisma/client';

export class AdminUserDetailEntity {
  constructor(
    public readonly id: string,
    public readonly email: string | null,
    public readonly displayName: string | null,
    public readonly role: Role,
    public readonly isGuest: boolean,
    public readonly textScale: TextScale,
    public readonly themeMode: ThemeMode,
    public readonly speechRate: number,
    public readonly soundEffectsOn: boolean,
    public readonly createdAt: Date,
    public readonly updatedAt: Date,
    public readonly progressCount: number,
    public readonly lastSeenAt: Date | null,
  ) {}
}
