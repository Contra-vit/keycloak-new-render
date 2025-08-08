#!/usr/bin/env bash
set -euo pipefail

# Render всегда задаёт $PORT. На локали пусть будет 8080.
: "${PORT:=8080}"

# По умолчанию включаем http (TLS терминируется на Render), слушаем нужный порт.
# Хост/прокси/hostname берём из ENV, которые ты уже добавил в render.yaml.
exec /opt/keycloak/bin/kc.sh start \
  --http-enabled=${KC_HTTP_ENABLED:-true} \
  --http-host=0.0.0.0 \
  --http-port=${PORT}
