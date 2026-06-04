import { registerDecorator, ValidationOptions } from 'class-validator';
import { IsEmailConstraint } from '../validators/is-email.validator';

export function IsEmail(validationOptions?: ValidationOptions) {
  return function (object: object, propertyName: string) {
    registerDecorator({
      target: object.constructor,
      propertyName,
      options: validationOptions,
      constraints: [],
      validator: IsEmailConstraint,
    });
  };
}
