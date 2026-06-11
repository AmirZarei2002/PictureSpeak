import {
  CanActivate,
  ExecutionContext,
  ForbiddenException,
  Injectable,
} from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { Role } from '@prisma/client';
import { AuthenticatedRequest } from '../types/authenticated-request.type';

@Injectable()
export class AdminGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const request = context.switchToHttp().getRequest<AuthenticatedRequest>();
    if (request.user?.role !== Role.ADMIN) {
      throw new ForbiddenException(
        I18nContext.current()?.t('admin.ADMIN_ONLY') ??
          'This action requires administrator privileges',
      );
    }
    return true;
  }
}
