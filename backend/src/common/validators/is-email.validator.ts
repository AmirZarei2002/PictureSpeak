import { Injectable } from '@nestjs/common';
import {
  ValidationArguments,
  ValidatorConstraint,
  ValidatorConstraintInterface,
} from 'class-validator';

@ValidatorConstraint({ name: 'isEmail', async: false })
@Injectable()
export class IsEmailConstraint implements ValidatorConstraintInterface {
  validate(email: string): boolean {
    if (!email || typeof email !== 'string') {
      return false;
    }

    email = email.trim().toLowerCase();

    if (email.length > 254) {
      return false;
    }

    const emailRegex =
      /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+$/;

    return emailRegex.test(email);
  }

  defaultMessage(args: ValidationArguments): string {
    return `The property "${args.property}" must be a valid email address`;
  }
}
