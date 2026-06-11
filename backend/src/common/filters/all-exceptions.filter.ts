import {
  ArgumentsHost,
  Catch,
  ExceptionFilter,
  HttpException,
  HttpStatus,
  Logger,
} from '@nestjs/common';
import { Response } from 'express';

const STATUS_TEXT: Record<number, string> = {
  [HttpStatus.BAD_REQUEST]: 'Bad Request',
  [HttpStatus.UNAUTHORIZED]: 'Unauthorized',
  [HttpStatus.FORBIDDEN]: 'Forbidden',
  [HttpStatus.NOT_FOUND]: 'Not Found',
  [HttpStatus.CONFLICT]: 'Conflict',
  [HttpStatus.UNPROCESSABLE_ENTITY]: 'Unprocessable Entity',
  [HttpStatus.TOO_MANY_REQUESTS]: 'Too Many Requests',
  [HttpStatus.INTERNAL_SERVER_ERROR]: 'Internal Server Error',
};

type AnyRecord = Record<string, unknown>;

@Catch()
export class AllExceptionsFilter implements ExceptionFilter {
  private readonly logger = new Logger(AllExceptionsFilter.name);

  catch(exception: unknown, host: ArgumentsHost): void {
    const response = host.switchToHttp().getResponse<Response>();

    if (exception instanceof HttpException) {
      const status = exception.getStatus();
      const raw = exception.getResponse();

      let message: string | string[];
      let error: string;

      if (typeof raw === 'string') {
        message = raw;
        error = STATUS_TEXT[status] ?? 'Error';
      } else {
        const obj = raw as AnyRecord;
        message = (obj.message as string | string[]) ?? exception.message;
        error =
          (obj.error as string) ?? STATUS_TEXT[status] ?? 'Error';
      }

      response.status(status).send({ statusCode: status, error, message });
      return;
    }

    this.logger.error(
      exception instanceof Error ? exception.stack : String(exception),
    );

    const status = HttpStatus.INTERNAL_SERVER_ERROR;
    response.status(status).send({
      statusCode: status,
      error: STATUS_TEXT[status],
      message: 'Internal server error',
    });
  }
}
