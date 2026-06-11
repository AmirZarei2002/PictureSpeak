import { Role } from '@prisma/client';

export class AdminUserListItemEntity {
  constructor(
    public readonly id: string,
    public readonly email: string | null,
    public readonly displayName: string | null,
    public readonly role: Role,
    public readonly isGuest: boolean,
    public readonly createdAt: Date,
    public readonly favoritesCount: number,
    public readonly progressCount: number,
    public readonly lastSeenAt: Date | null,
  ) {}
}
