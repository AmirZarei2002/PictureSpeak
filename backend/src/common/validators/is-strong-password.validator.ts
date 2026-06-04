import { ValidatorConstraintInterface } from 'class-validator';

export class IsStrongPasswordConstraint implements ValidatorConstraintInterface {
  validate(password: string) {
    if (typeof password !== 'string') return false;

    const strongPasswordRegex =
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    return strongPasswordRegex.test(password);
  }

  defaultMessage() {
    return 'Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.';
  }
}
