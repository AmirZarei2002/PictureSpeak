import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import { UserEntity } from '@modules/user/domain/entities/user.entity';
import { IFindUserByIdRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class GetUserByIdUseCase {
  constructor(
    private readonly findUserByIdRepository: IFindUserByIdRepository,
  ) {}

  async execute(id: string): Promise<UserEntity | null> {
    const user = await this.findUserByIdRepository.findById(id);

    if (!user) {
      throw new EntityNotFoundException('User');
    }

    return user;
  }
}
