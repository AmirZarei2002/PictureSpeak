export class TopCategoryEntity {
  constructor(
    public readonly categoryId: string,
    public readonly categorySlug: string,
    public readonly categoryName: string,
    public readonly colorHex: string,
    public readonly favoriteCount: number,
  ) {}
}
