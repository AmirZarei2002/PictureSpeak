import { Injectable } from '@nestjs/common';
import { RoleEntity } from '../../domain/entities/role.entity';
import { ICreateRoleRepository } from '../../domain/interfaces/role.repository.interface';
import { CreateRoleDto } from '../dto/create-role.dto';

@Injectable()
export class CreateRoleUseCase {
  constructor(private readonly createRoleRepository: ICreateRoleRepository) {}

  async execute(data: CreateRoleDto): Promise<RoleEntity> {
    return await this.createRoleRepository.create(data);
  }
}
