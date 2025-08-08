FROM quay.io/keycloak/keycloak:24.0.4

# Админ создастся на первом запуске
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Render задаёт PORT в рантайме; оставим дефолт на локалке
ENV PORT=8080

# Кладём старт-скрипт и сразу даём права (без RUN chmod)
COPY --chmod=0755 start.sh /opt/keycloak/start.sh

# Жёстко переопределяем ENTRYPOINT, чтобы не мешал базовый
ENTRYPOINT ["/bin/bash", "-lc", "/opt/keycloak/start.sh"]
