import { Injectable, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { PassportStrategy } from '@nestjs/passport';
import { Request } from 'express';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { AuthenticatedUser } from '@common/decorators/current-user.decorator';
import { JwtPayload } from '@modules/auth/domain/types/auth.types';
import { TokenBlacklistService } from '@modules/auth/infrastructure/services/token-blacklist.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy) {
  constructor(
    configService: ConfigService,
    private readonly tokenBlacklist: TokenBlacklistService,
  ) {
    const secret = configService.get<string>('JWT_SECRET');
    if (!secret) {
      throw new Error('JWT_SECRET is not configured');
    }
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      ignoreExpiration: false,
      secretOrKey: secret,
      passReqToCallback: true,
    });
  }

  async validate(
    req: Request,
    payload: JwtPayload,
  ): Promise<AuthenticatedUser> {
    if (!payload?.sub) {
      throw new UnauthorizedException();
    }
    const token = ExtractJwt.fromAuthHeaderAsBearerToken()(req);
    if (token && (await this.tokenBlacklist.isBlacklisted(token))) {
      throw new UnauthorizedException();
    }
    return {
      id: payload.sub,
      isGuest: payload.isGuest,
      role: payload.role,
    };
  }
}
