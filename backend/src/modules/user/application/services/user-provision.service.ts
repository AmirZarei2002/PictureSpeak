import { Injectable } from '@nestjs/common';
import { PrismaService } from '@prisma/prisma.service';
import {
  ICreateUserRepository,
  IFindUserByEmailRepository,
  IUserProvisionService,
} from '@modules/user/domain/interfaces/user.repository.interface';
import { getDefaultRoleId } from '@utils/get-default-role-id';

@Injectable()
export class UserProvisionService implements IUserProvisionService {
  constructor(
    private readonly findUserByEmailRepository: IFindUserByEmailRepository,
    private readonly createUserRepo: ICreateUserRepository,
    private readonly prisma: PrismaService,
  ) {}

  async findOrCreateUser(email: string) {
    let user = await this.findUserByEmailRepository.findByEmail(email);

    if (!user) {
      const defaultRoleId = await getDefaultRoleId(this.prisma);
      user = await this.createUserRepo.create({
        email,
        password: '',
        roleId: defaultRoleId,
      });
    }

    return user;
  }
}
