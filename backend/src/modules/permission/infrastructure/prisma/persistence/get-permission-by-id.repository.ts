import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import { IFindPermissionByIdRepository } from '@modules/permission/domain/interfaces/permission.repository.interface';
import { PermissionMapper } from '@modules/permission/domain/mappers/permission.mapper';

@Injectable()
export class GetPermissionByIdRepository implements IFindPermissionByIdRepository {
  constructor(private readonly prisma: PrismaService) {}

  async findOne(id: string): Promise<PermissionEntity | null> {
    const permission = await this.prisma.permission.findUnique({
      where: { id },
    });
    if (!permission) return null;
    return PermissionMapper.toEntity(permission);
  }
}
