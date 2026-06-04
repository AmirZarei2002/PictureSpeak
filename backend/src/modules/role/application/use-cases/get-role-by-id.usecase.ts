import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import { RoleEntity } from '../../domain/entities/role.entity';
import { IFindRoleByIdRepository } from '../../domain/interfaces/role.repository.interface';

@Injectable()
export class GetRoleByIdUseCase {
  constructor(
    private readonly findRoleByIdRepository: IFindRoleByIdRepository,
  ) {}

  async execute(id: string): Promise<RoleEntity | null> {
    const role = await this.findRoleByIdRepository.findOne(id);

    if (!role) {
      throw new EntityNotFoundException('Role');
    }

    return role;
  }
}
