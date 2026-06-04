import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import { RoleEntity } from '../../domain/entities/role.entity';
import {
  IFindRoleByIdRepository,
  IUpdateRoleRepository,
} from '../../domain/interfaces/role.repository.interface';
import { UpdateRoleDto } from '../dto/update-role.dto';

@Injectable()
export class UpdateRoleUseCase {
  constructor(
    private readonly updateRoleRepository: IUpdateRoleRepository,
    private readonly findRoleByIdRepository: IFindRoleByIdRepository,
  ) {}

  async execute(id: string, data: UpdateRoleDto): Promise<RoleEntity> {
    const roleExists = await this.findRoleByIdRepository.findOne(id);

    if (!roleExists) {
      throw new EntityNotFoundException('Role');
    }

    const role = await this.updateRoleRepository.update(id, data);
    if (!role) {
      throw new EntityNotFoundException('Role');
    }

    return role;
  }
}
