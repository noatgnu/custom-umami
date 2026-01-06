FROM ghcr.io/umami-software/umami:latest

USER root

RUN apk add --no-cache curl tar

RUN mkdir -p /app/geo && \
    curl -L "https://github.com/P3TERX/GeoLite.mmdb/raw/download/GeoLite2-Country.mmdb" \
    -o /app/geo/GeoLite2-City.mmdb

RUN chown -R umami:umami /app/geo

ENV GEO_DATABASE_URL=none

USER umami
EXPOSE 3000