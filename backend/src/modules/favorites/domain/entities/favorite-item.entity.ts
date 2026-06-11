export class FavoriteItemEntity {
  constructor(
    public readonly itemId: string,
    public readonly itemSlug: string,
    public readonly itemName: string,
    public readonly imagePath: string,
    public readonly thumbnailPath: string | null,
    public readonly audioPath: string | null,
    public readonly categoryId: string,
    public readonly categorySlug: string,
    public readonly categoryName: string,
    public readonly categoryColorHex: string,
    public readonly favoritedAt: Date,
  ) {}
}
