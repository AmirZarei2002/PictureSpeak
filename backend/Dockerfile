# syntax=docker/dockerfile:1.7
#
# Multi-stage build for the NestJS backend.
# Optimized for SLOW / LOSSY networks: BuildKit cache mounts, pinned pnpm,
# minimal network round-trips, and a single dependency download path.
#
# Build with BuildKit (default in Docker 23+ / Compose v2):
#   DOCKER_BUILDKIT=1 docker build -t picturespeak-backend .

# ---- Build-time arguments (override with --build-arg if you need to bump) ----
ARG NODE_VERSION=22.12.0
# Pin pnpm to an EXACT version (no @latest, no semver range). Match your host
# `pnpm --version` to keep the lockfile resolution identical across machines.
ARG PNPM_VERSION=10.4.1

############################################################
# Stage 1: base — node + system deps + pinned pnpm
############################################################
FROM node:${NODE_VERSION}-alpine AS base

# - libc6-compat: glibc shim required by some prebuilt native binaries (bcrypt, prisma engines)
# - openssl: required by Prisma query engine at runtime AND build time
# - ca-certificates: TLS to registry.npmjs.org on stripped Alpine
# - tini: PID-1 reaper (will be used in runner)
RUN apk add --no-cache libc6-compat openssl ca-certificates tini

# Configure npm BEFORE installing pnpm so that the bootstrap itself is
# resilient to the same flaky network that hurts the pnpm install later.
#  - fetch-retries=10: tolerate up to 10 dropped connections per package
#  - mintimeout/maxtimeout: exponential backoff window between retries
#  - fetch-timeout=600000: a single tarball can take up to 10 minutes
#    (useful when the average speed is 13 KiB/s as the logs showed)
RUN npm config set fetch-retries 10 \
 && npm config set fetch-retry-mintimeout 20000 \
 && npm config set fetch-retry-maxtimeout 120000 \
 && npm config set fetch-timeout 600000 \
 && npm config set update-notifier false \
 && npm config set fund false \
 && npm config set audit false

# Pin pnpm to an exact version. This layer is invalidated only when
# PNPM_VERSION or the base image changes — so on a normal source edit
# we NEVER reach the npm registry.
ARG PNPM_VERSION
ENV PNPM_HOME=/pnpm
ENV PATH=$PNPM_HOME:$PATH
RUN --mount=type=cache,id=npm-cache,target=/root/.npm,sharing=locked \
    npm install -g --prefer-offline pnpm@${PNPM_VERSION}

# Force every pnpm invocation in every stage to use the SAME store path,
# which we will then mount as a BuildKit cache below.
RUN pnpm config set store-dir /pnpm/store \
 && pnpm config set package-import-method copy

WORKDIR /app

############################################################
# Stage 2: deps — install ALL dependencies (incl. dev) once
############################################################
FROM base AS deps

# Build tools for native modules (bcrypt). Only present in the deps stage,
# never in the final image. Acts as a fallback when `prebuild-install`
# can't reach GitHub releases on a flaky network — we compile from source.
RUN apk add --no-cache --virtual .build-deps python3 make g++

# Copy ONLY the files pnpm needs to resolve and install. Anything else here
# would invalidate the install layer on unrelated source edits.
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
# .npmrc.docker carries network/retry tuning for in-container pnpm.
COPY .npmrc.docker ./.npmrc

# THE critical optimisation for slow networks:
#  - --mount=type=cache (sharing=locked): persistent pnpm content-addressable
#    store reused across builds. Second build downloads ~zero bytes.
#  - --frozen-lockfile: hard-fail on lockfile drift (reproducibility).
#  - --prefer-offline: hit the store first, only fall back to the registry
#    for genuinely missing tarballs. Skips the metadata round-trip on cache
#    hits (no HTTP per package when the store is warm).
#  - --reporter=append-only: cleaner logs in CI; avoids spinner repaint noise
#    when stdout is throttled by slow output.
RUN --mount=type=cache,id=pnpm-store,target=/pnpm/store,sharing=locked \
    pnpm install --frozen-lockfile --prefer-offline --reporter=append-only

############################################################
# Stage 3: builder — generate Prisma client, compile TS, prune dev deps
############################################################
FROM deps AS builder

# Copy source LAST and granularly so that editing TypeScript files does NOT
# invalidate any of the layers above (apk packages, pnpm install, etc).
COPY tsconfig*.json nest-cli.json prisma.config.ts ./
COPY prisma ./prisma
COPY scripts ./scripts
COPY src ./src

# Generate the Prisma client into node_modules — required before `nest build`
# because the compiled JS imports `@prisma/client`'s generated types.
RUN pnpm exec prisma generate

# Compile TS -> dist/
RUN pnpm run build

# Strip dev dependencies in-place. This avoids a SECOND `pnpm install --prod`
# pass against the registry (which the old Dockerfile did in a separate
# `prod-deps` stage — doubling the download volume on a slow link).
# Cache mount stays attached so prune can re-link from the store if needed.
RUN --mount=type=cache,id=pnpm-store,target=/pnpm/store,sharing=locked \
    pnpm prune --prod --config.confirmModulesPurge=false

############################################################
# Stage 4: runner — minimal final image
############################################################
FROM node:${NODE_VERSION}-alpine AS runner

# Runtime-only system deps: no python, no gcc, no pnpm.
# - openssl: prisma query engine loads libssl at startup
# - libc6-compat: bcrypt/prisma prebuilt binaries link against glibc
# - tini: forward signals (SIGTERM) to node so the app shuts down cleanly
RUN apk add --no-cache libc6-compat openssl tini \
 && addgroup --system --gid 1001 nodejs \
 && adduser  --system --uid 1001 --ingroup nodejs nestjs

WORKDIR /app

ENV NODE_ENV=production \
    PORT=3000 \
    # Avoid V8 OOM when allocating Prisma engine buffers on small containers
    NODE_OPTIONS=--enable-source-maps

# Copy ONLY what the runtime needs. All four COPYs are from the builder so
# the prisma client (generated into node_modules) is consistent with the
# compiled dist/ that imports it.
COPY --from=builder --chown=nestjs:nodejs /app/node_modules      ./node_modules
COPY --from=builder --chown=nestjs:nodejs /app/dist              ./dist
COPY --from=builder --chown=nestjs:nodejs /app/prisma            ./prisma
COPY --from=builder --chown=nestjs:nodejs /app/prisma.config.ts  ./prisma.config.ts
COPY --from=builder --chown=nestjs:nodejs /app/package.json      ./package.json

# Writable mount points for uploads and logs (also bound from compose).
RUN mkdir -p uploads logs && chown -R nestjs:nodejs uploads logs

USER nestjs

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
  CMD node dist/scripts/check-db-health.js || exit 1

# tini reaps zombies and forwards signals — important for clean shutdown
# of the NestJS process inside Compose / Kubernetes.
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "dist/src/main.js"]
