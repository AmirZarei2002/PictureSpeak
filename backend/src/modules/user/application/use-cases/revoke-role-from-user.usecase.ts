import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import {
  IFindUserByIdRepository,
  IRevokeRoleRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class RevokeRoleFromUserUseCase {
  constructor(
    private readonly revokeRoleRepository: IRevokeRoleRepository,
    private readonly findUserByIdRepository: IFindUserByIdRepository,
  ) {}

  async execute(userId: string): Promise<void> {
    const user = await this.findUserByIdRepository.findById(userId);

    if (!user) {
      throw new EntityNotFoundException('User');
    }

    await this.revokeRoleRepository.revokeRole(userId);
  }
}
