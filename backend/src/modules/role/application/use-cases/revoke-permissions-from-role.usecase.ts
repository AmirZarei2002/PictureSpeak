import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import {
  IFindRoleByIdRepository,
  IRevokePermissionsRepository,
} from '../../domain/interfaces/role.repository.interface';
import { RevokePermissionsFromRoleDto } from '../dto/revoke-permissions-from-role.dto';

@Injectable()
export class RevokePermissionsFromRoleUseCase {
  constructor(
    private readonly revokePermissionRepository: IRevokePermissionsRepository,
    private readonly findRoleByIdRepository: IFindRoleByIdRepository,
  ) {}

  async execute(
    roleId: string,
    data: RevokePermissionsFromRoleDto,
  ): Promise<void> {
    const role = await this.findRoleByIdRepository.findOne(roleId);

    if (!role) {
      throw new EntityNotFoundException(`Role`);
    }

    await this.revokePermissionRepository.revokePermissions(roleId, data);
  }
}
