import { registerDecorator, ValidationOptions } from 'class-validator';
import { i18nValidationMessage } from 'nestjs-i18n';
import { IsStrongPasswordConstraint } from '../validators/is-strong-password.validator';

export function IsStrongPassword(validationOptions?: ValidationOptions) {
  return function (object: object, propertyName: string) {
    registerDecorator({
      target: object.constructor,
      propertyName,
      options: {
        message: i18nValidationMessage('validation.IS_STRONG_PASSWORD'),
        ...validationOptions,
      },
      constraints: [],
      validator: IsStrongPasswordConstraint,
    });
  };
}
