import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import { UpdatePermissionDto } from '@modules/permission/application/dto/update-permission.dto';
import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import {
  IFindPermissionByIdRepository,
  IUpdatePermissionRepository,
} from '@modules/permission/domain/interfaces/permission.repository.interface';

@Injectable()
export class UpdatePermissionUseCase {
  constructor(
    private readonly updatePermissionRepository: IUpdatePermissionRepository,
    private readonly findPermissionByIdRepository: IFindPermissionByIdRepository,
  ) {}

  async execute(
    id: string,
    data: UpdatePermissionDto,
  ): Promise<PermissionEntity> {
    const permissionExists =
      await this.findPermissionByIdRepository.findOne(id);

    if (!permissionExists) {
      throw new EntityNotFoundException('Permission');
    }

    const permission = await this.updatePermissionRepository.update(id, data);
    if (!permission) {
      throw new EntityNotFoundException('Permission');
    }

    return permission;
  }
}
