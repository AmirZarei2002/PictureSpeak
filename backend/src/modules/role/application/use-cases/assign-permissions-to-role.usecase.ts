import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import {
  IAssignPermissionsRepository,
  IFindRoleByIdRepository,
} from '../../domain/interfaces/role.repository.interface';
import { AssignPermissionsToRoleDto } from '../dto/assign-permissions-to-role.dto';

@Injectable()
export class AssignPermissionsToRoleUseCase {
  constructor(
    private readonly assignPermissionRepository: IAssignPermissionsRepository,
    private readonly findRoleByIdRepository: IFindRoleByIdRepository,
  ) {}

  async execute(
    roleId: string,
    data: AssignPermissionsToRoleDto,
  ): Promise<void> {
    const role = await this.findRoleByIdRepository.findOne(roleId);

    if (!role) {
      throw new EntityNotFoundException(`Role`);
    }

    await this.assignPermissionRepository.assignPermissions(roleId, data);
  }
}
