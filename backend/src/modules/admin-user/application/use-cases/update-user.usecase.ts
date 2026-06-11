import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';
import { Role } from '@prisma/client';
import { AdminUserDetailEntity } from '@modules/admin-user/domain/entities/admin-user-detail.entity';
import {
  ICountAdminsRepository,
  IGetUserDetailRepository,
} from '@modules/admin-user/domain/interfaces/admin-user.repository.interface';
import {
  IFindUserByIdRepository,
  IUpdateUserRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';
import { UpdateUserAdminDto } from '../dtos/update-user-admin.dto';

@Injectable()
export class UpdateUserUseCase {
  constructor(
    private readonly findUserByIdRepository: IFindUserByIdRepository,
    private readonly updateUserRepository: IUpdateUserRepository,
    private readonly getUserDetailRepository: IGetUserDetailRepository,
    private readonly countAdminsRepository: ICountAdminsRepository,
  ) {}

  async execute(
    id: string,
    data: UpdateUserAdminDto,
  ): Promise<AdminUserDetailEntity> {
    const i18n = I18nContext.current();

    const current = await this.findUserByIdRepository.findById(id);
    if (!current) {
      throw new NotFoundException(
        i18n?.t('user.USER_NOT_FOUND') ?? 'User not found',
      );
    }

    if (
      data.role !== undefined &&
      data.role !== Role.ADMIN &&
      current.role === Role.ADMIN
    ) {
      const adminCount = await this.countAdminsRepository.count();
      if (adminCount <= 1) {
        throw new ConflictException(
          i18n?.t('admin.CANNOT_DEMOTE_LAST_ADMIN') ??
            'Cannot demote the last remaining admin',
        );
      }
    }

    await this.updateUserRepository.update(id, {
      role: data.role,
      displayName: data.displayName,
    });

    const detail = await this.getUserDetailRepository.getById(id);
    if (!detail) {
      throw new NotFoundException(
        i18n?.t('user.USER_NOT_FOUND') ?? 'User not found',
      );
    }
    return detail;
  }
}
