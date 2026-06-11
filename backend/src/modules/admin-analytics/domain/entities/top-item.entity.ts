export class TopItemEntity {
  constructor(
    public readonly itemId: string,
    public readonly itemSlug: string,
    public readonly itemName: string,
    public readonly categoryId: string,
    public readonly categorySlug: string,
    public readonly categoryName: string,
    public readonly totalViews: number,
    public readonly totalListens: number,
  ) {}
}
