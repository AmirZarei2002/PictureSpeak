import { registerDecorator, ValidationOptions } from 'class-validator';
import { i18nValidationMessage } from 'nestjs-i18n';
import { IsEmailConstraint } from '../validators/is-email.validator';

export function IsEmail(validationOptions?: ValidationOptions) {
  return function (object: object, propertyName: string) {
    registerDecorator({
      target: object.constructor,
      propertyName,
      options: {
        message: i18nValidationMessage('validation.IS_EMAIL'),
        ...validationOptions,
      },
      constraints: [],
      validator: IsEmailConstraint,
    });
  };
}
