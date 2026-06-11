import { applyDecorators } from '@nestjs/common';
import {
  ApiBadRequestResponse,
  ApiConflictResponse,
  ApiForbiddenResponse,
  ApiInternalServerErrorResponse,
  ApiNotFoundResponse,
  ApiTooManyRequestsResponse,
  ApiUnauthorizedResponse,
} from '@nestjs/swagger';
import {
  ConflictErrorResponse,
  ForbiddenErrorResponse,
  InternalServerErrorResponse,
  NotFoundErrorResponse,
  TooManyRequestsErrorResponse,
  UnauthorizedErrorResponse,
  ValidationErrorResponse,
} from '../schemas/error-response.schema';

type StandardErrorOptions = {
  validation?: boolean;
  unauthorized?: boolean;
  forbidden?: boolean;
  notFound?: boolean | string;
  conflict?: boolean | string;
  tooManyRequests?: boolean;
  internal?: boolean;
};

const defaults: StandardErrorOptions = {
  validation: false,
  unauthorized: false,
  forbidden: false,
  notFound: false,
  conflict: false,
  tooManyRequests: true,
  internal: true,
};

export function ApiStandardErrors(options: StandardErrorOptions = {}) {
  const opts = { ...defaults, ...options };
  const decorators: MethodDecorator[] = [];

  if (opts.validation) {
    decorators.push(
      ApiBadRequestResponse({
        description:
          'The request body failed validation. The response lists every failing field.',
        type: ValidationErrorResponse,
      }),
    );
  }

  if (opts.unauthorized) {
    decorators.push(
      ApiUnauthorizedResponse({
        description:
          'The access token is missing, expired, or invalid. Re-authenticate to obtain a new one.',
        type: UnauthorizedErrorResponse,
      }),
    );
  }

  if (opts.forbidden) {
    decorators.push(
      ApiForbiddenResponse({
        description:
          'The authenticated user is not permitted to perform this action.',
        type: ForbiddenErrorResponse,
      }),
    );
  }

  if (opts.notFound) {
    decorators.push(
      ApiNotFoundResponse({
        description:
          typeof opts.notFound === 'string'
            ? opts.notFound
            : 'The requested resource does not exist.',
        type: NotFoundErrorResponse,
      }),
    );
  }

  if (opts.conflict) {
    decorators.push(
      ApiConflictResponse({
        description:
          typeof opts.conflict === 'string'
            ? opts.conflict
            : 'The request conflicts with the current state of the resource (e.g. unique constraint violation, business-rule guard).',
        type: ConflictErrorResponse,
      }),
    );
  }

  if (opts.tooManyRequests) {
    decorators.push(
      ApiTooManyRequestsResponse({
        description:
          'Rate limit exceeded. The global limit is 10 requests per 60 seconds per client IP.',
        type: TooManyRequestsErrorResponse,
      }),
    );
  }

  if (opts.internal) {
    decorators.push(
      ApiInternalServerErrorResponse({
        description:
          'An unexpected error occurred. The incident is logged server-side.',
        type: InternalServerErrorResponse,
      }),
    );
  }

  return applyDecorators(...decorators);
}
