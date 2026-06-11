import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_GUARD, APP_INTERCEPTOR } from '@nestjs/core';
import { ThrottlerGuard, ThrottlerModule } from '@nestjs/throttler';
import corsConfig from './config/cors.config';
import { AdminAnalyticsModule } from './modules/admin-analytics/admin-analytics.module';
import { AdminUserModule } from './modules/admin-user/admin-user.module';
import { AuthModule } from './modules/auth/auth.module';
import { ContentModule } from './modules/content/content.module';
import { FavoritesModule } from './modules/favorites/favorites.module';
import { ProgressModule } from './modules/progress/progress.module';
import { UploadModule } from './modules/upload/upload.module';
import { UserModule } from './modules/user/user.module';
import { PrismaModule } from './prisma/prisma.module';
import { PrismaService } from './prisma/prisma.service';
import { CustomCacheModule } from './shared/cache/cache.module';
import { I18nModule } from './shared/i18n/i18n.module';
import { LoggingInterceptor } from './shared/interceptors/logging.interceptor';
import { CustomLoggerService } from './shared/services/custom-logger.service';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      load: [corsConfig],
    }),
    ThrottlerModule.forRoot({
      throttlers: [
        {
          ttl: 60000,
          limit: 10,
        },
      ],
    }),
    PrismaModule,
    CustomCacheModule,
    I18nModule,
    UserModule,
    AuthModule,
    ContentModule,
    FavoritesModule,
    ProgressModule,
    AdminUserModule,
    AdminAnalyticsModule,
    UploadModule,
  ],
  providers: [
    PrismaService,
    CustomLoggerService,
    {
      provide: APP_GUARD,
      useClass: ThrottlerGuard,
    },
    {
      provide: APP_INTERCEPTOR,
      useClass: LoggingInterceptor,
    },
  ],
})
export class AppModule {}
