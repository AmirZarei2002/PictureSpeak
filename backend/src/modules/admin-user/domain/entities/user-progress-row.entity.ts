export class UserProgressRowEntity {
  constructor(
    public readonly itemId: string,
    public readonly itemSlug: string,
    public readonly itemName: string,
    public readonly categoryId: string,
    public readonly categorySlug: string,
    public readonly categoryName: string,
    public readonly viewCount: number,
    public readonly listenCount: number,
    public readonly firstSeenAt: Date,
    public readonly lastSeenAt: Date,
  ) {}
}
