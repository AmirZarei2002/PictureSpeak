import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import { PasswordService } from '@shared/services/password.service';
import { UpdateUserDto } from '@modules/user/application/dto/update-user.dto';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import {
  IFindUserByIdRepository,
  IUpdateUserRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class UpdateUserUseCase {
  constructor(
    private readonly updateUserRepository: IUpdateUserRepository,
    private readonly findUserByIdRepository: IFindUserByIdRepository,
    private readonly passwordService: PasswordService,
  ) {}

  async execute(id: string, data: Partial<UpdateUserDto>): Promise<UserEntity> {
    const userExists = await this.findUserByIdRepository.findById(id);

    if (!userExists) {
      throw new EntityNotFoundException('User');
    }

    const updateData = { ...data };

    if (data.password) {
      updateData.password = await this.passwordService.hashPassword(
        data.password,
      );
    } else {
      delete updateData.password;
    }

    const user = await this.updateUserRepository.update(id, updateData);

    if (!user) {
      throw new EntityNotFoundException('User');
    }

    return user;
  }
}
