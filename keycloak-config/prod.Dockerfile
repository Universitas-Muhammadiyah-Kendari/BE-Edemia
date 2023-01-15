FROM jboss/keycloak:20.0.1

RUN find / -perm +6000 -type f -exec chmod a-s {} \; || true

HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 CMD curl --fail http://localhost:8080/realms/master