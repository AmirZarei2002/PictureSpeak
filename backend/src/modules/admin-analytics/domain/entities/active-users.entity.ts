export class DauPoint {
  constructor(
    public readonly day: string,
    public readonly count: number,
  ) {}
}

export class ActiveUsersEntity {
  constructor(
    public readonly windowDays: number,
    public readonly dau: number,
    public readonly wau: number,
    public readonly mau: number,
    public readonly series: DauPoint[],
  ) {}
}
