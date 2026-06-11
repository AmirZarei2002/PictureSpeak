import { Injectable } from '@nestjs/common';
import { CategoryEntity } from '@modules/content/domain/entities/category.entity';
import { IFindCategoriesRepository } from '@modules/content/domain/interfaces/content.repository.interface';

@Injectable()
export class GetCategoriesUseCase {
  constructor(
    private readonly findCategoriesRepository: IFindCategoriesRepository,
  ) {}

  execute(): Promise<CategoryEntity[]> {
    return this.findCategoriesRepository.findAll();
  }
}
