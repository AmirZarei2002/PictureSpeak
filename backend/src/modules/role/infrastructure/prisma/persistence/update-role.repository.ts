import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { UpdateRoleDto } from '@modules/role/application/dto/update-role.dto';
import { RoleEntity } from '@modules/role/domain/entities/role.entity';
import { IUpdateRoleRepository } from '@modules/role/domain/interfaces/role.repository.interface';
import { RoleMapper } from '@modules/role/domain/mappers/role.mapper';

@Injectable()
export class UpdateRoleRepository implements IUpdateRoleRepository {
  constructor(private readonly prisma: PrismaService) {}

  async update(id: string, data: UpdateRoleDto): Promise<RoleEntity | null> {
    const role = await this.prisma.role.update({
      where: { id },
      data,
    });
    return RoleMapper.toEntity(role);
  }
}
