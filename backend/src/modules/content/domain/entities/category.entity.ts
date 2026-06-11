export class CategoryEntity {
  constructor(
    public readonly id: string,
    public readonly slug: string,
    public readonly name: string,
    public readonly coverImagePath: string,
    public readonly colorHex: string,
    public readonly sortOrder: number,
    public readonly isActive: boolean,
    public readonly itemCount: number = 0,
  ) {}
}
