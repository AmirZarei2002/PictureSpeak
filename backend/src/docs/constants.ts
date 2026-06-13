export const API_TITLE = 'PictureSpeak API';
export const API_VERSION = '1.0.0';
export const API_DOCS_PATH = 'docs';
export const API_JSON_PATH = 'docs-json';

export const BEARER_AUTH_NAME = 'access-token';

export const TAGS = {
  Authentication: 'Authentication',
  Account: 'Account',
  Categories: 'Categories',
  Progress: 'Progress',
  AdminUsers: 'Admin · Users',
  AdminCategories: 'Admin · Categories',
  AdminItems: 'Admin · Learning items',
  AdminAnalytics: 'Admin · Analytics',
} as const;

export const API_DESCRIPTION = `
# PictureSpeak Developer API

PictureSpeak is a picture-based vocabulary learning platform. This document is the
canonical reference for the HTTP API consumed by the Flutter mobile client and any
third-party integrations.

## Base URL

\`\`\`
{server}/api/v{version}
\`\`\`

Versioning is **URI-based** and the default version is \`1\`. New, non-backwards-compatible
endpoints will be published under \`/api/v2\`. Within a major version, additive changes
(new optional fields, new endpoints) will not break clients.

## Authentication

Most endpoints require a **Bearer JWT** in the \`Authorization\` header:

\`\`\`
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
\`\`\`

Tokens are obtained via \`POST /auth/login\`, \`POST /auth/register\`, or \`POST /auth/guest\`.
Guest tokens carry an anonymous, app-generated identity and can be **upgraded** to a
full account via \`PATCH /auth/upgrade\` without losing progress.

Token lifetime defaults to **30 days** (configurable via \`JWT_EXPIRES_IN\`). There is
currently no refresh-token rotation — clients should re-authenticate when they receive
a \`401 Unauthorized\` response.

## Rate Limiting

A global throttler is in effect: **10 requests per 60 seconds per IP**. Exceeding the
limit returns \`429 Too Many Requests\`. Burst-tolerant endpoints (such as
\`POST /progress/events\`) should be called with batched payloads rather than one
request per event.

## Errors

Error responses share a consistent envelope. See the \`ErrorResponse\` and
\`ValidationErrorResponse\` schemas under **Schemas**.

## Conventions

* All timestamps are **ISO-8601** in UTC (\`2026-06-08T14:23:00.000Z\`).
* All identifiers are **UUID v4** unless explicitly noted as a slug.
* Decimal preference fields (e.g. \`speechRate\`) are JSON numbers.
* Empty success responses use HTTP \`204 No Content\`.
`;
