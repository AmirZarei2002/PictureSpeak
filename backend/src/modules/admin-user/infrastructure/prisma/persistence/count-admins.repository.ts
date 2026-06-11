import { Injectable } from '@nestjs/common';
import { Role } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { ICountAdminsRepository } from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';

@Injectable()
export class CountAdminsRepository implements ICountAdminsRepository {
  constructor(private readonly prisma: PrismaService) {}

  count(): Promise<number> {
    return this.prisma.user.count({ where: { role: Role.ADMIN } });
  }
}
