import { Injectable } from '@nestjs/common';
import { CreatePermissionDto } from '@modules/permission/application/dto/create-permission.dto';
import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import { ICreatePermissionRepository } from '@modules/permission/domain/interfaces/permission.repository.interface';

@Injectable()
export class CreatePermissionUseCase {
  constructor(
    private readonly createPermissionRepository: ICreatePermissionRepository,
  ) {}

  async execute(data: CreatePermissionDto): Promise<PermissionEntity> {
    return await this.createPermissionRepository.create(data);
  }
}
