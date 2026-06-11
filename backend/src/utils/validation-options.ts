import { ValidationError, ValidationPipeOptions } from '@nestjs/common';

export const validationPipeOptions: ValidationPipeOptions = {
  transform: true,
  whitelist: true,
  forbidNonWhitelisted: true,
};

export type FlatFieldError = { property: string; errors: string[] };

export function flattenValidationErrors(
  validationErrors: ValidationError[],
): FlatFieldError[] {
  const flat: FlatFieldError[] = [];

  const walk = (errors: ValidationError[], parentProperty = ''): void => {
    for (const error of errors) {
      const propertyPath = parentProperty
        ? `${parentProperty}.${error.property}`
        : error.property;

      if (error.constraints) {
        flat.push({
          property: propertyPath,
          errors: Object.values(error.constraints),
        });
      }

      if (error.children?.length) {
        walk(error.children, propertyPath);
      }
    }
  };

  walk(validationErrors);
  return flat;
}
