import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { IDeleteRoleRepository } from '@modules/role/domain/interfaces/role.repository.interface';

@Injectable()
export class DeleteRoleRepository implements IDeleteRoleRepository {
  constructor(private readonly prisma: PrismaService) {}

  async delete(id: string): Promise<void> {
    await this.prisma.role.delete({ where: { id } });
  }
}
