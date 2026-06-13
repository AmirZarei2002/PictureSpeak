export class AnalyticsOverviewEntity {
  constructor(
    public readonly totalUsers: number,
    public readonly guestUsers: number,
    public readonly registeredUsers: number,
    public readonly totalAdmins: number,
    public readonly totalCategories: number,
    public readonly activeCategories: number,
    public readonly totalItems: number,
    public readonly activeItems: number,
    public readonly totalProgressRows: number,
  ) {}
}
