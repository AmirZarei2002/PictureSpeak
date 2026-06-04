import { Permission as PrismaPermission } from '@prisma/client';
import { PermissionEntity } from '../entities/permission.entity';

export class PermissionMapper {
  static toEntity(permission: PrismaPermission): PermissionEntity {
    return new PermissionEntity(
      permission.id,
      permission.name,
      permission.action,
      permission.createdAt,
      permission.updatedAt,
    );
  }
}
