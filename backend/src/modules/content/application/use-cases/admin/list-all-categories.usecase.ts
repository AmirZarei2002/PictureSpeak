import { Injectable } from '@nestjs/common';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import { IListAllCategoriesRepository } from '@modules/content/domain/interfaces/content.repository.interface';

@Injectable()
export class ListAllCategoriesUseCase {
  constructor(private readonly repository: IListAllCategoriesRepository) {}

  execute(): Promise<CategoryEntity[]> {
    return this.repository.listAll();
  }
}
