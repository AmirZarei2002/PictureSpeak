import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { CreatePermissionDto } from '@modules/permission/application/dto/create-permission.dto';
import { PermissionEntity } from '@modules/permission/domain/entities/permission.entity';
import { ICreatePermissionRepository } from '@modules/permission/domain/interfaces/permission.repository.interface';
import { PermissionMapper } from '@modules/permission/domain/mappers/permission.mapper';

@Injectable()
export class CreatePermissionsRepository implements ICreatePermissionRepository {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreatePermissionDto): Promise<PermissionEntity> {
    const permission = await this.prisma.permission.create({
      data,
    });
    return PermissionMapper.toEntity(permission);
  }
}
