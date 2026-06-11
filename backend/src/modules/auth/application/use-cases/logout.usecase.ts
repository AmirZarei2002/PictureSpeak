import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { TokenBlacklistService } from '@modules/auth/infrastructure/services/token-blacklist.service';

@Injectable()
export class LogoutUseCase {
  constructor(
    private readonly jwtService: JwtService,
    private readonly tokenBlacklist: TokenBlacklistService,
  ) {}

  async execute(token: string): Promise<void> {
    const decoded = this.jwtService.decode<{ exp?: number } | null>(token);
    const nowSeconds = Math.floor(Date.now() / 1000);
    const remaining = (decoded?.exp ?? nowSeconds) - nowSeconds;
    await this.tokenBlacklist.blacklist(token, remaining);
  }
}
