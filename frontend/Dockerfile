# syntax=docker/dockerfile:1.7
#
# Multi-target build for the PictureSpeak Flutter frontend.
#
# Targets:
#   web         (default) - compiles Flutter Web and serves it via nginx on :80.
#                           Reverse-proxies /api and /static to the backend
#                           service (see frontend/nginx.conf).
#   apk-export            - compiles a release APK and exports it via a tiny
#                           BusyBox stage so `docker compose --profile apk run`
#                           can copy it out to a host volume.
#
# Build examples:
#   docker build --target web        -t picturespeak-frontend-web .
#   docker build --target apk-export -t picturespeak-frontend-apk .

ARG FLUTTER_IMAGE=ghcr.io/cirruslabs/flutter:stable

############################################################
# Stage: deps - resolve pub packages once, reuse for every build
############################################################
FROM ${FLUTTER_IMAGE} AS deps

# The cirruslabs image runs as root and pre-creates /sdks/flutter. Pre-warm
# pub-cache permissions so subsequent stages can write without sudo.
ENV PUB_CACHE=/root/.pub-cache

WORKDIR /app

# Copy ONLY the pubspec files first so `flutter pub get` is cached and not
# invalidated by source edits.
COPY pubspec.yaml pubspec.lock ./

# `flutter pub get` needs the l10n.yaml config + lib/l10n .arb files to
# generate AppLocalizations, but copying them in `deps` would invalidate
# the cache on every translation tweak. Defer codegen to the build stage.
RUN --mount=type=cache,id=pub-cache,target=/root/.pub-cache \
    --mount=type=cache,id=flutter-tool,target=/sdks/flutter/bin/cache \
    flutter pub get

############################################################
# Stage: web-build - compile Flutter Web bundle
############################################################
FROM deps AS web-build

# Copy the rest of the project. .dockerignore keeps build/, .dart_tool/,
# android/, ios/, etc. out of the context.
COPY . .

# Re-run pub get against the full project (l10n.yaml is present now).
RUN --mount=type=cache,id=pub-cache,target=/root/.pub-cache \
    --mount=type=cache,id=flutter-tool,target=/sdks/flutter/bin/cache \
    flutter pub get

# API_HOST is baked into the bundle for non-web targets only; on web we use
# relative URLs (see api_client.dart), but we still pass it so the build is
# deterministic regardless of which target is invoked.
ARG API_HOST=localhost:8080
RUN --mount=type=cache,id=pub-cache,target=/root/.pub-cache \
    --mount=type=cache,id=flutter-tool,target=/sdks/flutter/bin/cache \
    flutter build web --release \
      --dart-define=API_HOST=${API_HOST}

############################################################
# Stage: web - nginx serving the compiled bundle (DEFAULT TARGET)
############################################################
FROM nginx:1.27-alpine AS web

# Replace the default site with our SPA + reverse-proxy config.
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Drop the stock welcome page, copy the Flutter bundle.
RUN rm -rf /usr/share/nginx/html/*
COPY --from=web-build /app/build/web /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null || exit 1

############################################################
# Stage: apk-build - compile a release APK
############################################################
FROM deps AS apk-build

COPY . .

RUN --mount=type=cache,id=pub-cache,target=/root/.pub-cache \
    --mount=type=cache,id=flutter-tool,target=/sdks/flutter/bin/cache \
    flutter pub get

# Bake in the production API host the APK should talk to. Defaults to the
# Android-emulator host-loopback (10.0.2.2) so the existing local dev flow
# keeps working; override with --build-arg API_HOST=api.example.com:443.
ARG API_HOST=10.0.2.2:8000
# The android-ndk cache mount survives across builds even when this layer is
# invalidated (e.g. by changing API_HOST). Without it, every rebuild forces
# Gradle to re-download the NDK — a ~25min step on slow networks.
RUN --mount=type=cache,id=pub-cache,target=/root/.pub-cache \
    --mount=type=cache,id=flutter-tool,target=/sdks/flutter/bin/cache \
    --mount=type=cache,id=gradle-cache,target=/root/.gradle \
    --mount=type=cache,id=android-ndk,target=/opt/android-sdk-linux/ndk \
    flutter build apk --release \
      --dart-define=API_HOST=${API_HOST}

############################################################
# Stage: apk-export - tiny image whose only job is to hand off the APK
############################################################
FROM busybox:1.36 AS apk-export

COPY --from=apk-build /app/build/app/outputs/flutter-apk/app-release.apk /apk/app-release.apk

# The `apk-build` profile in docker-compose mounts ./build-output and copies
# the APK out, so this is the entrypoint when that one-shot service runs.
CMD ["sh", "-c", "mkdir -p /out && cp -v /apk/app-release.apk /out/app-release.apk"]
