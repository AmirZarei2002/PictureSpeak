import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { RevokePermissionsFromRoleDto } from '@modules/role/application/dto/revoke-permissions-from-role.dto';
import { IRevokePermissionsRepository } from '@modules/role/domain/interfaces/role.repository.interface';

@Injectable()
export class RevokePermissionsFromRoleRepository implements IRevokePermissionsRepository {
  constructor(private readonly prisma: PrismaService) {}

  async revokePermissions(
    roleId: string,
    data: RevokePermissionsFromRoleDto,
  ): Promise<void> {
    await this.prisma.role.update({
      where: { id: roleId },
      data: {
        permissions: {
          disconnect: data.permissions.map((permission) => ({
            id: permission,
          })),
        },
      },
    });
  }
}
