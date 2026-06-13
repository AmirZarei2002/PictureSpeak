import { readFileSync } from 'node:fs';
import { join } from 'node:path';
import { INestApplication, Logger } from '@nestjs/common';
import {
  DocumentBuilder,
  SwaggerCustomOptions,
  SwaggerModule,
} from '@nestjs/swagger';
import {
  API_DESCRIPTION,
  API_DOCS_PATH,
  API_JSON_PATH,
  API_TITLE,
  API_VERSION,
  BEARER_AUTH_NAME,
  TAGS,
} from './constants';
import {
  ActiveUsersResponse,
  AdminCategoryResponse,
  AdminLearningItemResponse,
  AdminUserDetailResponse,
  AdminUserListItemResponse,
  AnalyticsOverviewResponse,
  DauPointResponse,
  PaginatedAdminUsersResponse,
  PaginatedUserProgressResponse,
  TopItemResponse,
  UserProgressRowResponse,
} from './schemas/admin-response.schema';
import {
  CategoryResponse,
  LearningItemResponse,
} from './schemas/content-response.schema';
import {
  ConflictErrorResponse,
  ForbiddenErrorResponse,
  InternalServerErrorResponse,
  NotFoundErrorResponse,
  TooManyRequestsErrorResponse,
  UnauthorizedErrorResponse,
  ValidationErrorResponse,
  ValidationFieldError,
} from './schemas/error-response.schema';
import { PaginationMetaResponse } from './schemas/pagination-response.schema';
import {
  CategoryProgressResponse,
  ProgressSummaryResponse,
} from './schemas/progress-response.schema';
import { AuthResponse, UserResponse } from './schemas/user-response.schema';

function readAsset(filename: string): string | undefined {
  const candidates = [
    join(__dirname, 'assets', filename),
    join(__dirname, '..', '..', 'docs', 'assets', filename),
    join(__dirname, '..', '..', '..', 'docs', 'assets', filename),
    join(process.cwd(), 'src', 'docs', 'assets', filename),
    join(process.cwd(), 'dist', 'docs', 'assets', filename),
    join(process.cwd(), 'dist', 'src', 'docs', 'assets', filename),
  ];
  for (const candidate of candidates) {
    try {
      return readFileSync(candidate, 'utf8');
    } catch {
      /* try the next candidate */
    }
  }
  return undefined;
}

const FAVICON_DATA_URI = (() => {
  const svg = readAsset('favicon.svg');
  if (!svg) return undefined;
  const base64 = Buffer.from(svg, 'utf8').toString('base64');
  return `data:image/svg+xml;base64,${base64}`;
})();

const THEME_CSS = readAsset('swagger-theme.css') ?? '';

const TOPBAR_HTML = `
<div class="ps-topbar">
  <div class="ps-topbar__brand">
    <span class="ps-topbar__logo">P</span>
    <span>PictureSpeak <span style="color:var(--ps-text-mute);font-weight:500;">/ API Reference</span></span>
  </div>
  <div class="ps-topbar__meta">
    <span class="ps-topbar__env" id="ps-env">development</span>
    <span>v${API_VERSION}</span>
    <a href="/${API_JSON_PATH}" style="color:var(--ps-accent);text-decoration:none;">OpenAPI JSON</a>
  </div>
</div>
`;

const TOPBAR_INJECTION_SCRIPT = `
<script>
  (function () {
    var topbar = ${JSON.stringify(TOPBAR_HTML)};
    document.addEventListener('DOMContentLoaded', function () {
      var ui = document.getElementById('swagger-ui');
      if (ui && !document.querySelector('.ps-topbar')) {
        ui.insertAdjacentHTML('beforebegin', topbar);
        try {
          var env = (location.hostname === 'localhost' || location.hostname === '127.0.0.1')
            ? 'development'
            : (location.hostname.includes('staging') ? 'staging' : 'production');
          var envEl = document.getElementById('ps-env');
          if (envEl) envEl.textContent = env;
        } catch (e) { /* no-op */ }
      }
    });
  })();
</script>
`;

export function setupSwagger(app: INestApplication, port: string | number) {
  if (process.env.SWAGGER_ENABLED === 'false') {
    return;
  }

  const builder = new DocumentBuilder()
    .setTitle(API_TITLE)
    .setDescription(API_DESCRIPTION)
    .setVersion(API_VERSION)
    .setContact(
      'PictureSpeak Engineering',
      'https://picturespeak.example.com',
      'api@picturespeak.example.com',
    )
    .setLicense('Proprietary', 'https://picturespeak.example.com/terms')
    .setTermsOfService('https://picturespeak.example.com/terms')
    .addServer(
      process.env.API_PUBLIC_URL ?? `http://localhost:${port}`,
      'Current environment',
    )
    .addServer('http://10.0.2.2:8000', 'Android emulator (host loopback)')
    .addServer('https://api.picturespeak.example.com', 'Production')
    .addBearerAuth(
      {
        type: 'http',
        scheme: 'bearer',
        bearerFormat: 'JWT',
        description:
          'Paste the `accessToken` returned by `POST /auth/login`, `POST /auth/register`, or `POST /auth/guest`. Swagger will send it as `Authorization: Bearer <token>` on every request.',
      },
      BEARER_AUTH_NAME,
    )
    .addTag(
      TAGS.Authentication,
      'Register, log in, create guest sessions, and upgrade guests to full accounts.',
    )
    .addTag(
      TAGS.Account,
      'Read and update the authenticated user profile and preferences.',
    )
    .addTag(
      TAGS.Categories,
      'Browse vocabulary categories and the learning items they contain. Public, cached.',
    )
    .addTag(
      TAGS.Progress,
      'Record learning interactions (views, listens) and read aggregated progress.',
    )
    .addTag(
      TAGS.AdminUsers,
      'Admin-only. List, drill into, update role, and delete users. Includes per-user progress.',
    )
    .addTag(
      TAGS.AdminCategories,
      'Admin-only. CRUD for vocabulary categories (visible to learners only when `isActive`).',
    )
    .addTag(
      TAGS.AdminItems,
      'Admin-only. CRUD for learning items inside a category. Deletes cascade to progress.',
    )
    .addTag(
      TAGS.AdminAnalytics,
      'Admin-only. Platform totals, top items, DAU/WAU/MAU.',
    );

  const document = SwaggerModule.createDocument(app, builder.build(), {
    extraModels: [
      ValidationFieldError,
      ValidationErrorResponse,
      UnauthorizedErrorResponse,
      ForbiddenErrorResponse,
      NotFoundErrorResponse,
      ConflictErrorResponse,
      TooManyRequestsErrorResponse,
      InternalServerErrorResponse,
      UserResponse,
      AuthResponse,
      CategoryResponse,
      LearningItemResponse,
      CategoryProgressResponse,
      ProgressSummaryResponse,
      PaginationMetaResponse,
      AdminUserListItemResponse,
      AdminUserDetailResponse,
      PaginatedAdminUsersResponse,
      PaginatedUserProgressResponse,
      UserProgressRowResponse,
      AdminCategoryResponse,
      AdminLearningItemResponse,
      AnalyticsOverviewResponse,
      TopItemResponse,
      DauPointResponse,
      ActiveUsersResponse,
    ],
    operationIdFactory: (controllerKey, methodKey) =>
      `${controllerKey.replace(/Controller$/, '')}_${methodKey}`,
  });

  const customOptions: SwaggerCustomOptions = {
    customSiteTitle: `${API_TITLE} · Developer Reference`,
    customfavIcon: FAVICON_DATA_URI,
    customCss: THEME_CSS,
    customJsStr: TOPBAR_INJECTION_SCRIPT.replace(/^\s*<script>/, '').replace(
      /<\/script>\s*$/,
      '',
    ),
    jsonDocumentUrl: API_JSON_PATH,
    swaggerOptions: {
      persistAuthorization: true,
      displayRequestDuration: true,
      defaultModelsExpandDepth: 1,
      defaultModelExpandDepth: 2,
      docExpansion: 'list',
      filter: true,
      tryItOutEnabled: true,
      syntaxHighlight: { theme: 'monokai' },
      tagsSorter: 'alpha',
      operationsSorter: 'alpha',
    },
  };

  SwaggerModule.setup(API_DOCS_PATH, app, document, customOptions);

  Logger.log(
    `📘  API docs available at /${API_DOCS_PATH} (OpenAPI JSON at /${API_JSON_PATH})`,
    'Swagger',
  );
}
