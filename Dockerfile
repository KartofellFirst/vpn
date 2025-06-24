FROM caddy:2.7.6-builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/forwardproxy@caddy2

FROM caddy:2.7.6

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile

USER root
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
