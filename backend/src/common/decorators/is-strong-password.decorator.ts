import { registerDecorator, ValidationOptions } from 'class-validator';
import { IsStrongPasswordConstraint } from '../validators/is-strong-password.validator';

export function IsStrongPassword(ValidationOptions?: ValidationOptions) {
  return function (object: object, propertyName: string) {
    registerDecorator({
      target: object.constructor,
      propertyName,
      options: ValidationOptions,
      constraints: [],
      validator: IsStrongPasswordConstraint,
    });
  };
}
