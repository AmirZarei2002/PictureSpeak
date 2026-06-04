import { Injectable } from '@nestjs/common';
import { EntityNotFoundException } from '@common/exceptions/entity-not-found.exception';
import { AssignRoleToUserDto } from '@modules/user/application/dto/assign-role-to-user.dto';
import {
  IAssignRoleRepository,
  IFindUserByIdRepository,
} from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class AssignRoleToUserUseCase {
  constructor(
    private readonly assignRoleRepository: IAssignRoleRepository,
    private readonly findUserByIdRepository: IFindUserByIdRepository,
  ) {}

  async execute(userId: string, data: AssignRoleToUserDto): Promise<void> {
    const user = await this.findUserByIdRepository.findById(userId);

    if (!user) {
      throw new EntityNotFoundException('User');
    }

    await this.assignRoleRepository.assignRole(userId, data);
  }
}
