#!/usr/bin/env bash
# Smoke-test the dockerized PictureSpeak stack.
#
# Assumes `docker compose up -d` has been run from the repo root.
# Hits the backend directly on :8000 and through the nginx reverse-proxy
# on :8080 — both paths must work for the dockerized frontend to function.

set -euo pipefail

# ---- colors ----
RED=$'\033[0;31m'; GRN=$'\033[0;32m'; YLW=$'\033[1;33m'; NC=$'\033[0m'

pass=0; fail=0
check() {
  local name="$1" cmd="$2"
  if eval "$cmd" >/dev/null 2>&1; then
    echo "${GRN}PASS${NC}  $name"; pass=$((pass+1))
  else
    echo "${RED}FAIL${NC}  $name"; fail=$((fail+1))
  fi
}

http_status() {
  curl -s -o /dev/null -w '%{http_code}' "$1"
}

echo "${YLW}== container health ==${NC}"
check "postgres container running"       "docker ps --filter name=PictureSpeak-postgres   --filter status=running --format '{{.Names}}' | grep -q PictureSpeak-postgres"
check "redis container running"          "docker ps --filter name=PictureSpeak-redis      --filter status=running --format '{{.Names}}' | grep -q PictureSpeak-redis"
check "backend container running"        "docker ps --filter name=PictureSpeak-backend    --filter status=running --format '{{.Names}}' | grep -q PictureSpeak-backend"
check "frontend container running"       "docker ps --filter name=PictureSpeak-frontend   --filter status=running --format '{{.Names}}' | grep -q PictureSpeak-frontend"

echo
echo "${YLW}== backend (direct, :8000) ==${NC}"
check "GET /api/v1/categories returns <500"  "[ \"\$(http_status http://localhost:8000/api/v1/categories)\" -lt 500 ]"

echo
echo "${YLW}== frontend (nginx, :8080) ==${NC}"
check "GET / serves index.html"              "curl -s http://localhost:8080/ | grep -q 'flutter_bootstrap'"
check "GET /flutter_bootstrap.js exists"     "[ \"\$(http_status http://localhost:8080/flutter_bootstrap.js)\" = '200' ]"
check "Proxy /api/v1/categories works"       "[ \"\$(http_status http://localhost:8080/api/v1/categories)\" -lt 500 ]"
check "Proxy /static/ returns sane status"   "[ \"\$(http_status http://localhost:8080/static/nonexistent.png)\" = '404' ]"
check "SPA fallback for unknown route"       "curl -s http://localhost:8080/some/spa/route | grep -q 'flutter_bootstrap'"

echo
echo "${YLW}== summary ==${NC}"
echo "$pass passed, $fail failed"
[ "$fail" -eq 0 ]
