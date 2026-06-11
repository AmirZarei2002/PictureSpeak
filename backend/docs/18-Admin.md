# Admin

PictureSpeak ships with an in-app admin surface: user management, content CRUD,
and an analytics dashboard. Everything is gated by a single `Role` enum on
`User` (`USER` | `ADMIN`) — there is no separate RBAC layer.

## Bootstrap the first admin

Admin accounts are created by a seed script, driven by environment variables:

```bash
# backend/.env
ADMIN_EMAIL=admin@picturespeak.local
ADMIN_PASSWORD=ChangeMe123!
```

Then run:

```bash
pnpm admin:bootstrap
```

The script is **idempotent**:
- If no user with `ADMIN_EMAIL` exists → creates one with `role=ADMIN`.
- If a user with that email exists but is not an admin → promotes them.
- If they're already an admin → no-op.

Source: [`scripts/bootstrap-admin.ts`](../scripts/bootstrap-admin.ts).

## How role-based access works

- The `Role` enum lives in `prisma/schema.prisma`. `User.role` defaults to `USER`.
- The JWT payload carries `role` alongside `sub` and `isGuest`
  (see [`auth.types.ts`](../src/modules/auth/domain/types/auth.types.ts)).
- The JWT strategy hydrates `request.user` with `{ id, isGuest, role }`.
- [`AdminGuard`](../src/common/guards/admin.guard.ts) checks `request.user.role`
  and throws a translated `ForbiddenException` (`admin.ADMIN_ONLY`) otherwise.
- Admin controllers stack both guards: `@UseGuards(JwtAuthGuard, AdminGuard)`.

## Admin endpoints

All under `/api/v1/admin/...`, all admin-only.

### Users — `admin-user` module
- `GET /admin/users` — paginated; filters: `search`, `role`, `isGuest`.
- `GET /admin/users/:id` — full record + favorites/progress counts.
- `PATCH /admin/users/:id` — patch `role`, `displayName`. Blocks demoting the
  last admin (409).
- `DELETE /admin/users/:id` — hard delete; cascades favorites + progress.
  Blocks self-delete (400) and last-admin deletion (409).
- `GET /admin/users/:id/favorites` — paginated.
- `GET /admin/users/:id/progress` — paginated, per-item rows.

### Content — extends the existing `content` module
- `GET /admin/categories` — includes inactive.
- `POST /admin/categories` · `PATCH /admin/categories/:id` ·
  `DELETE /admin/categories/:id` — CRUD; deletion blocked (409) when items > 0.
- `GET /admin/categories/:categoryId/items` — items in a category, includes
  inactive.
- `POST /admin/categories/:categoryId/items` — slug must be unique within the
  category.
- `PATCH /admin/items/:id` · `DELETE /admin/items/:id` — item CRUD; delete
  cascades to favorites and progress.

### Analytics — `admin-analytics` module
- `GET /admin/analytics/overview` — platform totals (users, content,
  engagement).
- `GET /admin/analytics/top-items?limit&days` — Prisma `groupBy` aggregation
  over `Progress.viewCount`.
- `GET /admin/analytics/top-categories?limit` — favorite counts per category
  (raw SQL join Favorite→LearningItem).
- `GET /admin/analytics/active-users?days` — DAU/WAU/MAU + per-day series
  (raw SQL `DATE_TRUNC('day', "lastSeenAt")`).

## Translations

All admin-facing error messages route through `nestjs-i18n`. The new namespace
lives in `src/i18n/{en,fa}/admin.json` — when you add a new admin rule or error
message, add both locale variants. Keys currently defined:

`ADMIN_ONLY`, `CANNOT_DELETE_SELF`, `CANNOT_DELETE_LAST_ADMIN`,
`CANNOT_DEMOTE_LAST_ADMIN`, `CATEGORY_NOT_FOUND_BY_ID`, `ITEM_NOT_FOUND_BY_ID`,
`CATEGORY_SLUG_TAKEN`, `ITEM_SLUG_TAKEN`, `CATEGORY_HAS_ITEMS`.

Pattern in use-cases:

```ts
const i18n = I18nContext.current();
throw new ConflictException(
  i18n?.t('admin.CATEGORY_SLUG_TAKEN', { args: { slug: data.slug } }) ??
    `A category with slug "${data.slug}" already exists`,
);
```

The `?? fallback` is there because `I18nContext.current()` returns `undefined`
outside an HTTP request (seeders, scripts).

## Accessing the admin UI

The admin surface lives inside the Flutter app, gated by role:

1. Log in with the bootstrapped admin account.
2. Open the **Settings** tab.
3. Three admin tiles appear (only when `user.isAdmin`): Dashboard,
   Manage users, Manage categories.

Non-admin users never see the tiles, and the backend `AdminGuard` is the
authoritative check — a URL-hacking USER hits 403.
