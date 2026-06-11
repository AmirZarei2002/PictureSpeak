import { createHash } from 'crypto';
import { Injectable } from '@nestjs/common';
import { CacheService } from '@shared/cache/cache.service';

@Injectable()
export class TokenBlacklistService {
  private static readonly KEY_PREFIX = 'auth:blacklist:';

  constructor(private readonly cache: CacheService) {}

  async blacklist(token: string, ttlSeconds: number): Promise<void> {
    if (ttlSeconds <= 0) return;
    await this.cache.set(this.key(token), 1, ttlSeconds * 1000);
  }

  async isBlacklisted(token: string): Promise<boolean> {
    const hit = await this.cache.get<number>(this.key(token));
    return hit !== null && hit !== undefined;
  }

  private key(token: string): string {
    const hash = createHash('sha256').update(token).digest('hex');
    return `${TokenBlacklistService.KEY_PREFIX}${hash}`;
  }
}
