import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import {
  IDeletePermissionRepository,
  IFindPermissionByIdRepository,
} from '@modules/permission/domain/interfaces/permission.repository.interface';

@Injectable()
export class DeletePermissionUseCase {
  constructor(
    private readonly deletePermissionRepository: IDeletePermissionRepository,
    private readonly findPermissionByIdRepository: IFindPermissionByIdRepository,
  ) {}

  async execute(id: string): Promise<void> {
    const permission = await this.findPermissionByIdRepository.findOne(id);

    if (!permission) {
      throw new EntityNotFoundException('Permission');
    }

    return await this.deletePermissionRepository.delete(id);
  }
}
