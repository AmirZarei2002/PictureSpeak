import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { IRevokeRoleRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class RevokeUserRoleRepository implements IRevokeRoleRepository {
  constructor(private readonly prisma: PrismaService) {}

  async revokeRole(userId: string): Promise<void> {
    await this.prisma.user.update({
      where: { id: userId },
      data: { role: { connect: { name: 'user' } } },
    });
  }
}
