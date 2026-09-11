# syntax=docker/dockerfile:1
# check=skip=InvalidDefaultArgInFrom
ARG UPSTREAM_IMAGE
ARG UPSTREAM_DIGEST_ARM64

FROM golang:alpine@sha256:cf6fca6641884b8433441b2b0652976f975e1d0fdd26d177eaaf8596087f3125 AS builder
ARG VERSION
RUN go install github.com/caddyserver/xcaddy/cmd/xcaddy@v0.4.7 && \
    xcaddy build v${VERSION} --output /caddy-bin \
        --with github.com/mholt/caddy-ratelimit@5625512f24f6f59d6f64fb3aafe5eecff0b286db \
        --with github.com/caddy-dns/njalla@v1.0.0 \
        --with github.com/caddy-dns/cloudflare@a8737d095ad5a48ca031cea6ab704057dbc2d250 && \
    chmod 755 /caddy-bin


FROM ${UPSTREAM_IMAGE}@${UPSTREAM_DIGEST_ARM64}
EXPOSE 8080 8443
ARG IMAGE_STATS
ENV IMAGE_STATS=${IMAGE_STATS} CUSTOM_BUILD="" WEBUI_PORTS="8080/tcp,8443/tcp"
COPY --from=builder /caddy-bin "${APP_DIR}/caddy"
COPY root/ /
RUN find /etc/s6-overlay/s6-rc.d -name "run*" -execdir chmod +x {} +
