import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '@prisma/prisma.service';
import { IDeleteItemRepository } from '@modules/content/domain/interfaces/content.repository.interface';

@Injectable()
export class DeleteItemRepository implements IDeleteItemRepository {
  constructor(private readonly prisma: PrismaService) {}

  async delete(id: string): Promise<boolean> {
    try {
      await this.prisma.learningItem.delete({ where: { id } });
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
