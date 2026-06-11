import { Role } from '@prisma/client';

export type AuthenticatedRequest = {
  user?: {
    id: string;
    isGuest: boolean;
    role: Role;
  };
};
