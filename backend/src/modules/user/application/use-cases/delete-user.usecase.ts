import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import {
  IDeleteUserRepository,
  IFindUserByIdRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class DeleteUserUseCase {
  constructor(
    private readonly deleteUserRepository: IDeleteUserRepository,
    private readonly findUserByIdRepository: IFindUserByIdRepository,
  ) {}

  async execute(id: string): Promise<void> {
    const user = await this.findUserByIdRepository.findById(id);

    if (!user) {
      throw new EntityNotFoundException('User');
    }

    await this.deleteUserRepository.delete(id);
  }
}
