export class CategoryProgress {
  constructor(
    public readonly categoryId: string,
    public readonly categorySlug: string,
    public readonly categoryName: string,
    public readonly explored: number,
    public readonly total: number,
  ) {}
}

export class ProgressSummaryEntity {
  constructor(
    public readonly totalViews: number,
    public readonly totalListens: number,
    public readonly itemsExplored: number,
    public readonly byCategory: CategoryProgress[],
  ) {}
}
