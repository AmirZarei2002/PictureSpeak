import { HttpStatus, VersioningType } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { useContainer } from 'class-validator';
import {
  I18nValidationException,
  I18nValidationExceptionFilter,
  I18nValidationPipe,
} from 'nestjs-i18n';
import { AppModule } from './app.module';
import { AllExceptionsFilter } from './common/filters/all-exceptions.filter';
import { getEnvArray } from './common/utils/env.util';
import { ICorsConfig } from './config/interfaces/cors-config.interface';
import { setupSwagger } from './docs/swagger.setup';
import { UPLOADS_ROOT } from './modules/upload/infrastructure/multer.config';
import { CustomLoggerService } from './shared/services/custom-logger.service';
import {
  flattenValidationErrors,
  validationPipeOptions,
} from './utils/validation-options';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule, {
    logger: new CustomLoggerService(),
  });

  app.useStaticAssets(UPLOADS_ROOT, { prefix: '/static/' });

  useContainer(app.select(AppModule), { fallbackOnErrors: true });

  app.setGlobalPrefix('api');

  app.enableVersioning({
    type: VersioningType.URI,
    defaultVersion: '1',
  });

  const configService = app.get(ConfigService);

  const corsConfig = configService.get<ICorsConfig>('cors');

  app.enableCors(corsConfig);

  app.useGlobalPipes(new I18nValidationPipe(validationPipeOptions));

  app.useGlobalFilters(
    new AllExceptionsFilter(),
    new I18nValidationExceptionFilter({
      detailedErrors: true,
      errorHttpStatusCode: HttpStatus.BAD_REQUEST,
      responseBodyFormatter: (_host, _exc: I18nValidationException, errors) => ({
        statusCode: HttpStatus.BAD_REQUEST,
        error: 'Bad Request',
        message: 'validation error',
        errors: flattenValidationErrors(errors as never),
      }),
    }),
  );

  const port = getEnvArray('PORT', ['3000'])[0];

  setupSwagger(app, port);

  await app.listen(port);
}
void bootstrap();
