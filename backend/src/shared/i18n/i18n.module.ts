import * as path from 'path';
import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import {
  AcceptLanguageResolver,
  HeaderResolver,
  I18nModule as NestI18nModule,
  QueryResolver,
} from 'nestjs-i18n';
import {
  DEFAULT_LOCALE,
  LANGUAGE_HEADER,
  LANGUAGE_QUERY_PARAM,
} from './constants/i18n.constants';

@Module({
  imports: [
    NestI18nModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => ({
        fallbackLanguage: configService.get<string>(
          'FALLBACK_LANGUAGE',
          DEFAULT_LOCALE,
        ),
        loaderOptions: {
          path: path.join(__dirname, '..', '..', 'i18n'),
          watch: configService.get<string>('NODE_ENV') !== 'production',
        },
        typesOutputPath: path.join(
          process.cwd(),
          'src/shared/i18n/generated/i18n.generated.ts',
        ),
      }),
      resolvers: [
        { use: QueryResolver, options: [LANGUAGE_QUERY_PARAM] },
        new HeaderResolver([LANGUAGE_HEADER]),
        AcceptLanguageResolver,
      ],
    }),
  ],
  exports: [NestI18nModule],
})
export class I18nModule {}
