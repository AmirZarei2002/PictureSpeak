import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import { IFindPermissionByIdRepository } from '@modules/permission/domain/interfaces/permission.repository.interface';

@Injectable()
export class GetPermissionByIdUseCase {
  constructor(
    private readonly findPermissionByIdRepository: IFindPermissionByIdRepository,
  ) {}

  async execute(id: string): Promise<PermissionEntity | null> {
    const permission = await this.findPermissionByIdRepository.findOne(id);

    if (!permission) {
      throw new EntityNotFoundException('Permission');
    }

    return permission;
  }
}
