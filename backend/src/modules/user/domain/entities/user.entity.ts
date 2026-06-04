import { RoleEntity } from '@modules/role/domain/entities/role.entity';

export class UserEntity {
  constructor(
    public readonly id: string,
    public readonly roleId: string,
    public readonly email: string,
    public readonly password: string,
    public readonly name: string,
    public readonly createdAt: Date,
    public readonly updatedAt: Date,
    public readonly role?: RoleEntity,
  ) {}
}
