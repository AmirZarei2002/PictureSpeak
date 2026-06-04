import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { RoleEntity } from '@modules/role/domain/entities/role.entity';
import { IFindRoleByIdRepository } from '@modules/role/domain/interfaces/role.repository.interface';
import { RoleMapper } from '@modules/role/domain/mappers/role.mapper';

@Injectable()
export class GetRoleByIdRepository implements IFindRoleByIdRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findOne(id: string): Promise<RoleEntity | null> {
    const role = await this.prisma.role.findUnique({
      include: { permissions: true },
      where: { id },
    });

    if (!role) return null;

    return RoleMapper.toEntity(role);
  }
}
