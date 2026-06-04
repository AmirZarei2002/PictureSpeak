import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { AssignPermissionsToRoleDto } from '@modules/role/application/dto/assign-permissions-to-role.dto';
import { IAssignPermissionsRepository } from '@modules/role/domain/interfaces/role.repository.interface';

@Injectable()
export class AssignPermissionsToRoleRepository implements IAssignPermissionsRepository {
  constructor(private readonly prisma: PrismaService) {}

  async assignPermissions(
    roleId: string,
    data: AssignPermissionsToRoleDto,
  ): Promise<void> {
    await this.prisma.role.update({
      where: { id: roleId },
      data: {
        permissions: {
          connect: data.permissions.map((permission) => ({ id: permission })),
        },
      },
    });
  }
}
