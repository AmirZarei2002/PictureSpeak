import { Permission, Role as PrismaRole } from '@prisma/client';
import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import { RoleEntity } from '../entities/role.entity';

export class RoleMapper {
  static toEntity(
    role: PrismaRole & { permissions?: Permission[] },
  ): RoleEntity {
    return new RoleEntity(
      role.id,
      role.name,
      role.createdAt,
      role.updatedAt,
      role.permissions
        ? role.permissions.map(
            (p) =>
              new PermissionEntity(
                p.id,
                p.name,
                p.action,
                p.createdAt,
                p.updatedAt,
              ),
          )
        : [],
    );
  }
}
