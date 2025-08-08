FROM quay.io/keycloak/keycloak:24.0.4

# Admin user for first boot (Keycloak will create it if not present)
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Render will inject PORT at runtime; default for local runs
ENV PORT=8080

# Optional but recommended for larger deployments:
# RUN /opt/keycloak/bin/kc.sh build

# Use shell-form CMD so env vars from Render expand at runtime
CMD /opt/keycloak/bin/kc.sh start \
  --hostname-url=${KC_HOSTNAME_URL} \
  --hostname-admin-url=${KC_HOSTNAME_ADMIN_URL} \
  --proxy-headers=${KC_PROXY_HEADERS} \
  --http-enabled=${KC_HTTP_ENABLED} \
  --http-host=0.0.0.0 \
  --http-port=${PORT}
