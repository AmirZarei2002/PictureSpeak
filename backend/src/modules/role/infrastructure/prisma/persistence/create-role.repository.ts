import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { CreateRoleDto } from '@modules/role/application/dto/create-role.dto';
import { RoleEntity } from '@modules/role/domain/entities/role.entity';
import { ICreateRoleRepository } from '@modules/role/domain/interfaces/role.repository.interface';
import { RoleMapper } from '@modules/role/domain/mappers/role.mapper';

@Injectable()
export class CreateRoleRepository implements ICreateRoleRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateRoleDto): Promise<RoleEntity> {
    const role = await this.prisma.role.create({ data });

    return RoleMapper.toEntity(role);
  }
}
