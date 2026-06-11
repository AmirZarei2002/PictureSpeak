import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { IDeleteUserRepository } from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';

@Injectable()
export class DeleteUserRepository implements IDeleteUserRepository {
  constructor(private readonly prisma: PrismaService) {}

  async delete(id: string): Promise<boolean> {
    try {
      await this.prisma.user.delete({ where: { id } });
      return true;
    } catch (error) {
      if (
        error instanceof Prisma.PrismaClientKnownRequestError &&
        error.code === 'P2025'
      ) {
        return false;
      }
      throw error;
    }
  }
}
