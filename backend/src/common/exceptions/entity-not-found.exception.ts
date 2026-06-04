import { NotFoundException } from '@nestjs/common';

export class EntityNotFoundException extends NotFoundException {
  constructor(entity: string, id?: string | number) {
    super(`${entity} ${id ? `with id ${id} ` : ''}not found`.trim());
  }
}
