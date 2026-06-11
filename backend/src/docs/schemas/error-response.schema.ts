import { ApiProperty } from '@nestjs/swagger';

export class ValidationFieldError {
  @ApiProperty({
    description:
      'Dotted path of the offending property in the request payload.',
    example: 'password',
  })
  property!: string;

  @ApiProperty({
    description: 'Human-readable validation messages for this property.',
    type: [String],
    example: [
      'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.',
    ],
  })
  errors!: string[];
}

export class ErrorResponse {
  @ApiProperty({
    description: 'HTTP status code mirrored in the response body.',
    example: 400,
  })
  statusCode!: number;

  @ApiProperty({
    description:
      'Short, machine-friendly error reason matching the HTTP status text.',
    example: 'Bad Request',
  })
  error!: string;

  @ApiProperty({
    description:
      'Human-readable explanation of what went wrong. May be a string or an array of strings.',
    oneOf: [{ type: 'string' }, { type: 'array', items: { type: 'string' } }],
    example: 'Invalid credentials',
  })
  message!: string | string[];
}

export class ValidationErrorResponse {
  @ApiProperty({ example: 400 })
  statusCode!: number;

  @ApiProperty({ example: 'Bad Request' })
  error!: string;

  @ApiProperty({
    description: 'Always "validation error" for class-validator failures.',
    example: 'validation error',
  })
  message!: string;

  @ApiProperty({
    description: 'Field-level breakdown of every failing validation rule.',
    type: [ValidationFieldError],
  })
  errors!: ValidationFieldError[];
}

export class UnauthorizedErrorResponse extends ErrorResponse {
  @ApiProperty({ example: 401 })
  declare statusCode: number;

  @ApiProperty({ example: 'Unauthorized' })
  declare error: string;

  @ApiProperty({ example: 'Unauthorized' })
  declare message: string;
}

export class ForbiddenErrorResponse extends ErrorResponse {
  @ApiProperty({ example: 403 })
  declare statusCode: number;

  @ApiProperty({ example: 'Forbidden' })
  declare error: string;

  @ApiProperty({
    example: 'You do not have permission to perform this action.',
  })
  declare message: string;
}

export class NotFoundErrorResponse extends ErrorResponse {
  @ApiProperty({ example: 404 })
  declare statusCode: number;

  @ApiProperty({ example: 'Not Found' })
  declare error: string;

  @ApiProperty({ example: 'LearningItem with id 7f3d8b... not found' })
  declare message: string;
}

export class ConflictErrorResponse extends ErrorResponse {
  @ApiProperty({ example: 409 })
  declare statusCode: number;

  @ApiProperty({ example: 'Conflict' })
  declare error: string;

  @ApiProperty({ example: 'Email is already registered' })
  declare message: string;
}

export class TooManyRequestsErrorResponse extends ErrorResponse {
  @ApiProperty({ example: 429 })
  declare statusCode: number;

  @ApiProperty({ example: 'Too Many Requests' })
  declare error: string;

  @ApiProperty({ example: 'ThrottlerException: Too Many Requests' })
  declare message: string;
}

export class InternalServerErrorResponse extends ErrorResponse {
  @ApiProperty({ example: 500 })
  declare statusCode: number;

  @ApiProperty({ example: 'Internal Server Error' })
  declare error: string;

  @ApiProperty({ example: 'Internal server error' })
  declare message: string;
}
