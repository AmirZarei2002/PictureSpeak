import {
  CanActivate,
  ExecutionContext,
  ForbiddenException,
  Injectable,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';

@Injectable()
export class PermissionsGuard implements CanActivate {
  constructor(private reflector: Reflector) {}

  canActivate(context: ExecutionContext): boolean {
    const requiredPermissions = this.reflector.get<string[]>(
      'permissions',
      context.getHandler(),
    );

    if (!requiredPermissions) {
      return true;
    }

    const request = context.switchToHttp().getRequest<{
      user: {
        userId: string;
        roleId: string;
        role: {
          name: string;
          permissions: { name: string; action: string }[];
        };
      };
    }>();
    const user = request.user;

    if (!user) throw new ForbiddenException('User not found');

    if (!user.role || !user.role.permissions) {
      throw new ForbiddenException('User role or permissions not found');
    }

    const userPermissions = user.role.permissions.map((perm) => perm.name);

    const hasPermission = requiredPermissions.every((perm) =>
      userPermissions.includes(perm),
    );

    if (!hasPermission) throw new ForbiddenException('Access denied');

    return true;
  }
}
