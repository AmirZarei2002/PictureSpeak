import { CacheModule } from '@nestjs/cache-manager';
import { Global, Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import * as redisStore from 'cache-manager-ioredis';
import { CacheService } from './cache.service';

@Global()
@Module({
  imports: [
    ConfigModule,
    CacheModule.registerAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (configService: ConfigService): any => {
        const redisHost = configService.get<string>('REDIS_HOST');
        const ttl = configService.get<number>('REDIS_TTL') ?? 60;
        if (!redisHost) {
          return { ttl };
        }
        return {
          store: redisStore,
          host: redisHost,
          port: configService.get<number>('REDIS_PORT'),
          ttl,
        };
      },
      isGlobal: true,
    }),
  ],
  providers: [CacheService],
  exports: [CacheService],
})
export class CustomCacheModule {}
