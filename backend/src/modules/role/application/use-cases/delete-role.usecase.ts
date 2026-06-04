import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import {
  IDeleteRoleRepository,
  IFindRoleByIdRepository,
} from '../../domain/interfaces/role.repository.interface';

@Injectable()
export class DeleteRoleUseCase {
  constructor(
    private readonly deleteRoleRepository: IDeleteRoleRepository,
    private readonly findRoleByIdRepository: IFindRoleByIdRepository,
  ) {}

  async execute(id: string): Promise<void> {
    const role = await this.findRoleByIdRepository.findOne(id);

    if (!role) {
      throw new EntityNotFoundException(`Role`);
    }

    return await this.deleteRoleRepository.delete(id);
  }
}
