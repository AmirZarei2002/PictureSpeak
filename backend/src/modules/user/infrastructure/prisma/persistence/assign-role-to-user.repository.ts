import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import { AssignRoleToUserDto } from '@modules/user/application/dto/assign-role-to-user.dto';
import { IAssignRoleRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class AssignRoleToUserRepository implements IAssignRoleRepository {
  constructor(private readonly prisma: PrismaService) {}

  async assignRole(userId: string, data: AssignRoleToUserDto): Promise<void> {
    await this.prisma.user.update({
      where: { id: userId },
      data,
    });
  }
}
