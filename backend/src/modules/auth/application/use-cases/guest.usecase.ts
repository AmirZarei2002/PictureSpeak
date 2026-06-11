import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import {
  AuthResponse,
  JwtPayload,
} from '@modules/auth/domain/types/auth.types';
import { ICreateUserRepository } from '@modules/user/domain/interfaces/user.repository.interface';

@Injectable()
export class GuestUseCase {
  constructor(
    private readonly createUserRepository: ICreateUserRepository,
    private readonly jwtService: JwtService,
  ) {}

  async execute(): Promise<AuthResponse> {
    const user = await this.createUserRepository.create({
      email: null,
      passwordHash: null,
      isGuest: true,
      displayName: null,
    });

    const payload: JwtPayload = {
      sub: user.id,
      isGuest: user.isGuest,
      role: user.role,
    };
    const accessToken = await this.jwtService.signAsync(payload);

    return { user, accessToken };
  }
}
