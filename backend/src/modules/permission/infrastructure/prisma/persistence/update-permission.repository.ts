import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { UpdatePermissionDto } from '@modules/permission/application/dto/update-permission.dto';
import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import { IUpdatePermissionRepository } from '@modules/permission/domain/interfaces/permission.repository.interface';
import { PermissionMapper } from '@modules/permission/domain/mappers/permission.mapper';

@Injectable()
export class UpdatePermissionRepository implements IUpdatePermissionRepository {
  constructor(private readonly prisma: PrismaService) {}

  async update(
    id: string,
    data: UpdatePermissionDto,
  ): Promise<PermissionEntity | null> {
    const permission = await this.prisma.permission.update({
      where: { id },
      data,
    });

    return PermissionMapper.toEntity(permission);
  }
}
