export class LearningItemEntity {
  constructor(
    public readonly id: string,
    public readonly categoryId: string,
    public readonly slug: string,
    public readonly name: string,
    public readonly imagePath: string,
    public readonly thumbnailPath: string | null,
    public readonly audioPath: string | null,
    public readonly sortOrder: number,
    public readonly isActive: boolean,
  ) {}
}
