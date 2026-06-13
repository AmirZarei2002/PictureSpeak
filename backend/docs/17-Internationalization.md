# Internationalization (i18n)

How translations are organized, resolved, and consumed across the backend.

Powered by [`nestjs-i18n`](https://nestjs-i18n.com/) with two languages out of
the box: **English (`en`)** and **Persian / Farsi (`fa`)**.

## 📁 File Layout

```
src/
├── i18n/                         # Translation content (JSON, loaded at runtime)
│   ├── en/
│   │   ├── common.json           # App-wide common strings
│   │   ├── validation.json       # class-validator messages
│   │   ├── errors.json           # Generic HTTP error messages
│   │   ├── auth.json             # Auth module messages
│   │   ├── user.json             # User module messages
│   │   └── content.json          # Content module messages
│   └── fa/
│       └── …                     # Same file set, Persian translations
│
└── shared/
    └── i18n/                     # i18n code (module, constants, enums)
        ├── constants/
        │   └── i18n.constants.ts # SUPPORTED_LOCALES, DEFAULT_LOCALE, headers
        ├── enums/
        │   └── locale.enum.ts    # Locale enum (EN / FA)
        ├── i18n.module.ts        # Wraps nestjs-i18n's I18nModule.forRootAsync
        └── index.ts              # Barrel export
```

Rationale:

- **`src/i18n/`** holds **content** (JSON). Treated like Prisma migrations:
  data, not code. Copied into `dist/` by `nest-cli.json` via the `assets` array.
- **`src/shared/i18n/`** holds **infrastructure** (the NestJS module wrapper,
  enums, constants). Lives in `shared/` because it is a cross-cutting,
  application-level feature, alongside `cache/`, `services/`, etc.

## 🔑 Path Aliases

Two aliases are configured in `tsconfig.json`:

| Alias       | Maps to                  | When to use                               |
| ----------- | ------------------------ | ----------------------------------------- |
| `@shared/*` | `src/shared/*`           | Import the module / constants / enums    |
| `@i18n/*`   | `src/i18n/*`             | Reserved for future helpers next to JSON |

The canonical import path is `@shared/i18n` — it re-exports everything
consumers need, including the most-used pieces of `nestjs-i18n`:

```typescript
import {
  I18nContext,
  I18nService,
  i18nValidationMessage,
  Locale,
  SUPPORTED_LOCALES,
} from '@shared/i18n';
```

## 🌐 Language Resolution

The active language for each request is resolved in this order
(first match wins):

1. **Query string** — `?lang=fa`
2. **Custom header** — `x-lang: fa`
3. **`Accept-Language`** header — e.g. `Accept-Language: fa-IR,fa;q=0.9,en;q=0.8`
4. **Fallback** — `FALLBACK_LANGUAGE` env var (default: `en`)

Configured in [src/shared/i18n/i18n.module.ts](../src/shared/i18n/i18n.module.ts).

## 📦 Translation File Conventions

One JSON file per **bounded context (module)** plus a few cross-cutting
namespaces. The filename (minus `.json`) becomes the **top-level namespace**
in translation keys.

| File              | Namespace      | Owns                                          |
| ----------------- | -------------- | --------------------------------------------- |
| `common.json`     | `common.*`     | App-wide strings (yes/no, language metadata)  |
| `validation.json` | `validation.*` | `class-validator` messages                    |
| `errors.json`     | `errors.*`     | Generic HTTP errors (entity not found, etc.)  |
| `auth.json`       | `auth.*`       | Auth module messages                          |
| `user.json`       | `user.*`       | User module messages                          |
| `content.json`    | `content.*`    | Content module messages                       |

### Key Naming

- **`SCREAMING_SNAKE_CASE`** for terminal keys (e.g. `INVALID_CREDENTIALS`).
- **Group with nested objects** when several keys belong together:

  ```json
  {
    "language": {
      "name": "English",
      "code": "en",
      "direction": "ltr"
    }
  }
  ```

- **Reference with dot notation** in code: `'auth.INVALID_CREDENTIALS'`,
  `'common.language.name'`.

### Interpolation

Use `{paramName}` placeholders. Pass the values via the `args` option when
translating:

```json
{
  "ENTITY_NOT_FOUND_BY_ID": "{entity} with id {id} not found"
}
```

```typescript
i18n.t('errors.ENTITY_NOT_FOUND_BY_ID', { args: { entity: 'User', id } });
```

For class-validator messages, the pipe automatically passes
`property`, `value`, and `constraints` as args:

```json
{
  "MIN_LENGTH": "{property} must be at least {constraints.0} characters long"
}
```

## 🧩 Integration Points

### 1. Validation Pipe (`class-validator` messages)

`main.ts` registers `I18nValidationPipe` instead of `ValidationPipe`. It
translates messages before handing them to the existing
`validationPipeOptions.exceptionFactory`, so the **response shape is
unchanged**:

```json
{
  "message": "validation error",
  "errors": [
    { "property": "email", "errors": ["مقدار «email» باید یک ایمیل معتبر باشد"] }
  ]
}
```

In DTOs, attach the i18n message via `i18nValidationMessage()`:

```typescript
import { i18nValidationMessage } from 'nestjs-i18n';
import { IsString, Length } from 'class-validator';

export class RegisterDto {
  @IsString({ message: i18nValidationMessage('validation.IS_STRING') })
  @Length(1, 50, { message: i18nValidationMessage('validation.LENGTH') })
  displayName?: string;
}
```

For **custom validators** (e.g. `@IsEmail`, `@IsStrongPassword`), the i18n
message is attached once inside the decorator factory — DTOs stay clean:

```typescript
// src/common/decorators/is-email.decorator.ts
registerDecorator({
  options: {
    message: i18nValidationMessage('validation.IS_EMAIL'),
    ...validationOptions,
  },
  validator: IsEmailConstraint,
});
```

The constraint's `defaultMessage()` remains as an English fallback.

### 2. Use Cases (throwing translated exceptions)

Use cases retrieve the current request's i18n context via
`I18nContext.current()` (works through `AsyncLocalStorage` — **no injection
required**):

```typescript
import { UnauthorizedException, Injectable } from '@nestjs/common';
import { I18nContext } from 'nestjs-i18n';

@Injectable()
export class LoginUseCase {
  async execute(data: LoginDto): Promise<AuthResponse> {
    const user = await this.findUserByEmailRepository.findByEmail(data.email);

    if (!user) {
      throw new UnauthorizedException(
        I18nContext.current()?.t('auth.INVALID_CREDENTIALS'),
      );
    }
    // …
  }
}
```

When you need interpolation:

```typescript
throw new NotFoundException(
  I18nContext.current()?.t('content.CATEGORY_NOT_FOUND', { args: { slug } }),
);
```

### 3. Shared exceptions

`EntityNotFoundException` automatically pulls the request's language and
falls back to English if no context is active:

```typescript
throw new EntityNotFoundException('User', userId);
// en: "User with id abc123 not found"
// fa: "User با شناسه abc123 یافت نشد"
```

If you want the entity name itself translated, pass an already-translated
string:

```typescript
const i18n = I18nContext.current();
const entityLabel = i18n?.t('user.LABEL') ?? 'User';
throw new EntityNotFoundException(entityLabel, userId);
```

### 4. Outside the request lifecycle (jobs, seeds)

`I18nContext.current()` returns `undefined` outside requests. Inject
`I18nService` instead and pass an explicit language:

```typescript
import { I18nService } from 'nestjs-i18n';

@Injectable()
export class WelcomeEmailJob {
  constructor(private readonly i18n: I18nService) {}

  async run(user: UserEntity) {
    const message = await this.i18n.t('auth.EMAIL_ALREADY_IN_USE', {
      lang: user.preferredLanguage ?? 'en',
    });
  }
}
```

## ➕ Adding a New Language

1. Create the locale folder: `src/i18n/<code>/`.
2. Copy every JSON file from `src/i18n/en/` and translate the **values
   only** — keys must stay identical across locales.
3. Add the code to the `Locale` enum and to `SUPPORTED_LOCALES`
   ([src/shared/i18n/](../src/shared/i18n/)).
4. Restart the server. No further wiring is needed — the loader picks up
   new directories automatically.

## ➕ Adding a New Module

1. Create `src/i18n/en/<module>.json` and `src/i18n/fa/<module>.json` with
   matching keys.
2. Reference them by the file's namespace in code: `<module>.KEY`.
3. Throw translated exceptions from use cases using `I18nContext.current()`.

## ⚙️ Build Notes

`nest-cli.json` copies `i18n/**/*.json` into the `dist/` folder during
`nest build`. The runtime path resolves to:

- **Dev** (`pnpm start:dev`): `src/i18n/`
- **Prod** (`pnpm start:prod`): `dist/i18n/`

In development, file watching is enabled — edits to JSON files reload
without restarting the server. Watching is disabled when
`NODE_ENV=production`.

## ✅ Best Practices

- **One key per concept**, not per call site. Reuse `auth.USER_NOT_FOUND`
  instead of inventing `auth.USER_NOT_FOUND_DURING_LOGIN`.
- **Keep keys flat** within a file — at most one level of nesting for
  grouped metadata (like `common.language.*`).
- **Use `SCREAMING_SNAKE_CASE`** for terminal keys; they are constants.
- **Always pass `args` for placeholders**, never string-interpolate before
  calling `t()` — that defeats translation:

  ```typescript
  // ❌ Bad — placeholder is baked into the message
  i18n.t('content.CATEGORY_NOT_FOUND', { args: { slug: `Category "${slug}"` } });

  // ✅ Good — let the JSON template wrap the value
  i18n.t('content.CATEGORY_NOT_FOUND', { args: { slug } });
  ```

- **Don't translate inside the domain layer.** Throw plain exceptions with
  i18n keys at the application layer; the domain stays framework-agnostic.

## 🔗 Related Documentation

- [`02-Project-Structure.md`](02-Project-Structure.md) — where i18n fits
- [`07-DTOs-And-Validation.md`](07-DTOs-And-Validation.md) — DTO validation patterns
- [`12-Import-Patterns.md`](12-Import-Patterns.md) — path aliases
- [`15-Environment-Variables.md`](15-Environment-Variables.md) — `FALLBACK_LANGUAGE`
