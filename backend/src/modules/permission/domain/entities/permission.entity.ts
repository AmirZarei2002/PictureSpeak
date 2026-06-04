export class PermissionEntity {
  constructor(
    public readonly id: string,
    public readonly name: string,
    public readonly action: string,
    public readonly createdAt: Date,
    public readonly updatedAt: Date,
  ) {}
}
