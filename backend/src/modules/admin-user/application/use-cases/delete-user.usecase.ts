import {
  BadRequestException,
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { Role } from '@prisma/client';
import {
  ICountAdminsRepository,
  IDeleteUserRepository,
} from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';
import { IFindUserByIdRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class DeleteUserUseCase {
  constructor(
    private readonly findUserByIdRepository: IFindUserByIdRepository,
    private readonly deleteUserRepository: IDeleteUserRepository,
    private readonly countAdminsRepository: ICountAdminsRepository,
  ) {}

  async execute(actingAdminId: string, targetId: string): Promise<void> {
    const i18n = I18nContext.current();

    if (actingAdminId === targetId) {
      throw new BadRequestException(
        i18n?.t('admin.CANNOT_DELETE_SELF') ??
          'Admins cannot delete their own account',
      );
    }

    const target = await this.findUserByIdRepository.findById(targetId);
    if (!target) {
      throw new NotFoundException(
        i18n?.t('user.USER_NOT_FOUND') ?? 'User not found',
      );
    }

    if (target.role === Role.ADMIN) {
      const adminCount = await this.countAdminsRepository.count();
      if (adminCount <= 1) {
        throw new ConflictException(
          i18n?.t('admin.CANNOT_DELETE_LAST_ADMIN') ??
            'Cannot delete the last remaining admin',
        );
      }
    }

    const deleted = await this.deleteUserRepository.delete(targetId);
    if (!deleted) {
      throw new NotFoundException(
        i18n?.t('user.USER_NOT_FOUND') ?? 'User not found',
      );
    }
  }
}
