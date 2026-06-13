import { ApiProperty } from '@nestjs/swagger';
import { Role, TextScale, ThemeMode } from '@prisma/client';
import { PaginationMetaResponse } from './pagination-response.schema';

export class AdminUserListItemResponse {
  @ApiProperty({
    format: 'uuid',
    example: 'a3e1c7d2-9b8e-4c41-9b2c-5f72c8e0b6a4',
  })
  id!: string;

  @ApiProperty({ nullable: true, format: 'email', example: 'sara@example.com' })
  email!: string | null;

  @ApiProperty({ nullable: true, example: 'Sara T.' })
  displayName!: string | null;

  @ApiProperty({
    enum: Role,
    enumName: 'Role',
    example: Role.USER,
  })
  role!: Role;

  @ApiProperty({ example: false })
  isGuest!: boolean;

  @ApiProperty({ format: 'date-time', example: '2026-04-12T08:14:55.000Z' })
  createdAt!: string;

  @ApiProperty({
    description: 'Total progress rows (≈ distinct items engaged).',
    example: 34,
  })
  progressCount!: number;

  @ApiProperty({
    description:
      'Most recent Progress.lastSeenAt for this user. `null` if they have never engaged with any item.',
    nullable: true,
    format: 'date-time',
    example: '2026-06-07T17:11:00.000Z',
  })
  lastSeenAt!: string | null;
}

export class PaginatedAdminUsersResponse {
  @ApiProperty({ type: [AdminUserListItemResponse] })
  data!: AdminUserListItemResponse[];

  @ApiProperty({ type: PaginationMetaResponse })
  meta!: PaginationMetaResponse;
}

export class AdminUserDetailResponse extends AdminUserListItemResponse {
  @ApiProperty({
    enum: TextScale,
    enumName: 'TextScale',
    example: TextScale.normal,
  })
  textScale!: TextScale;

  @ApiProperty({
    enum: ThemeMode,
    enumName: 'ThemeMode',
    example: ThemeMode.system,
  })
  themeMode!: ThemeMode;

  @ApiProperty({ minimum: 0.5, maximum: 2.0, example: 1.0 })
  speechRate!: number;

  @ApiProperty({ example: true })
  soundEffectsOn!: boolean;

  @ApiProperty({ format: 'date-time', example: '2026-06-08T11:02:00.000Z' })
  updatedAt!: string;
}

export class UserProgressRowResponse {
  @ApiProperty({ format: 'uuid' })
  itemId!: string;

  @ApiProperty({ example: 'elephant' })
  itemSlug!: string;

  @ApiProperty({ example: 'Elephant' })
  itemName!: string;

  @ApiProperty({ format: 'uuid' })
  categoryId!: string;

  @ApiProperty({ example: 'animals' })
  categorySlug!: string;

  @ApiProperty({ example: 'Animals' })
  categoryName!: string;

  @ApiProperty({ example: 9 })
  viewCount!: number;

  @ApiProperty({ example: 4 })
  listenCount!: number;

  @ApiProperty({ format: 'date-time', example: '2026-05-22T08:00:00.000Z' })
  firstSeenAt!: string;

  @ApiProperty({ format: 'date-time', example: '2026-06-07T17:11:00.000Z' })
  lastSeenAt!: string;
}

export class PaginatedUserProgressResponse {
  @ApiProperty({ type: [UserProgressRowResponse] })
  data!: UserProgressRowResponse[];

  @ApiProperty({ type: PaginationMetaResponse })
  meta!: PaginationMetaResponse;
}

export class AdminCategoryResponse {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty({ pattern: '^[a-z0-9-]+$', example: 'animals' })
  slug!: string;

  @ApiProperty({ example: 'Animals' })
  name!: string;

  @ApiProperty({ example: 'categories/animals/cover.webp' })
  coverImagePath!: string;

  @ApiProperty({ pattern: '^#[0-9a-fA-F]{6}$', example: '#7BAFD4' })
  colorHex!: string;

  @ApiProperty({ example: 10 })
  sortOrder!: number;

  @ApiProperty({ example: true })
  isActive!: boolean;

  @ApiProperty({
    description: 'Total items (including inactive) in the category.',
    example: 24,
  })
  itemCount!: number;
}

export class AdminLearningItemResponse {
  @ApiProperty({ format: 'uuid' })
  id!: string;

  @ApiProperty({ format: 'uuid' })
  categoryId!: string;

  @ApiProperty({ pattern: '^[a-z0-9-]+$', example: 'elephant' })
  slug!: string;

  @ApiProperty({ example: 'Elephant' })
  name!: string;

  @ApiProperty({ example: 'items/animals/elephant.webp' })
  imagePath!: string;

  @ApiProperty({ nullable: true, example: 'items/animals/elephant.thumb.webp' })
  thumbnailPath!: string | null;

  @ApiProperty({ nullable: true, example: 'items/animals/elephant.mp3' })
  audioPath!: string | null;

  @ApiProperty({ example: 30 })
  sortOrder!: number;

  @ApiProperty({ example: true })
  isActive!: boolean;
}

export class AnalyticsOverviewResponse {
  @ApiProperty({ example: 245 })
  totalUsers!: number;

  @ApiProperty({ example: 188 })
  guestUsers!: number;

  @ApiProperty({ example: 57 })
  registeredUsers!: number;

  @ApiProperty({ example: 2 })
  totalAdmins!: number;

  @ApiProperty({ example: 14 })
  totalCategories!: number;

  @ApiProperty({ example: 12 })
  activeCategories!: number;

  @ApiProperty({ example: 318 })
  totalItems!: number;

  @ApiProperty({ example: 296 })
  activeItems!: number;

  @ApiProperty({ example: 4980 })
  totalProgressRows!: number;
}

export class TopItemResponse {
  @ApiProperty({ format: 'uuid' })
  itemId!: string;

  @ApiProperty({ example: 'elephant' })
  itemSlug!: string;

  @ApiProperty({ example: 'Elephant' })
  itemName!: string;

  @ApiProperty({ format: 'uuid' })
  categoryId!: string;

  @ApiProperty({ example: 'animals' })
  categorySlug!: string;

  @ApiProperty({ example: 'Animals' })
  categoryName!: string;

  @ApiProperty({ example: 482 })
  totalViews!: number;

  @ApiProperty({ example: 119 })
  totalListens!: number;
}

export class DauPointResponse {
  @ApiProperty({
    description: 'ISO date (UTC), inclusive of the whole 24h bucket.',
    example: '2026-06-08',
  })
  day!: string;

  @ApiProperty({ example: 14 })
  count!: number;
}

export class ActiveUsersResponse {
  @ApiProperty({
    description: 'Window the series covers, in days.',
    example: 30,
  })
  windowDays!: number;

  @ApiProperty({ description: 'Daily active users (last 24h).', example: 22 })
  dau!: number;

  @ApiProperty({
    description: 'Weekly active users (last 7 days).',
    example: 71,
  })
  wau!: number;

  @ApiProperty({
    description: 'Monthly active users (last 30 days).',
    example: 144,
  })
  mau!: number;

  @ApiProperty({
    description:
      'Daily series across the window. Missing days are filled with 0.',
    type: [DauPointResponse],
  })
  series!: DauPointResponse[];
}
