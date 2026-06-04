import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import { UserEntity } from '@modules/user/domain/entities/user.entity';

export class RoleEntity {
  constructor(
    public readonly id: string,
    public readonly name: string,
    public readonly createdAt: Date,
    public readonly updatedAt: Date,
    public readonly permissions?: PermissionEntity[],
    public readonly users?: UserEntity[],
  ) {}
}
