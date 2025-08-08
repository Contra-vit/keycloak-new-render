FROM quay.io/keycloak/keycloak:24.0.4

# Админ создастся на первом запуске
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Кладём наш старт-скрипт
COPY start.sh /start.sh
RUN chmod +x /start.sh

# ВАЖНО: переопределяем ENTRYPOINT и явно запускаем наш скрипт через bash
ENTRYPOINT ["/bin/bash", "-lc", "/start.sh"]
