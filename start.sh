#!/usr/bin/env bash
set -euo pipefail

: "${PORT:=8080}"

# Берём значения из env (ты их уже добавил в render.yaml)
exec /opt/keycloak/bin/kc.sh start \
  --hostname-url="${KC_HOSTNAME_URL:-}" \
  --hostname-admin-url="${KC_HOSTNAME_ADMIN_URL:-}" \
  --proxy-headers="${KC_PROXY_HEADERS:-xforwarded}" \
  --http-enabled="${KC_HTTP_ENABLED:-true}" \
  --http-host=0.0.0.0 \
  --http-port="${PORT}"
