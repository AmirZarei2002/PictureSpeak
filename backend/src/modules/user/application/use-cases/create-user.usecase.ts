import { Injectable } from '@nestjs/common';
import { PasswordService } from '@shared/services/password.service';
import { CreateUserDto } from '@modules/user/application/dto/create-user.dto';
import { ICreateUserRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class CreateUserUseCase {
  constructor(
    private readonly createUserRepository: ICreateUserRepository,
    private readonly passwordService: PasswordService,
  ) {}

  async execute(data: CreateUserDto) {
    const hashedPassword = await this.passwordService.hashPassword(
      data.password,
    );

    return this.createUserRepository.create({
      ...data,
      password: hashedPassword,
    });
  }
}
