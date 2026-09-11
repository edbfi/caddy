#!/usr/bin/env bash
set -euo pipefail
image="$1"
evidence="$2"
bash tools/base-smoke.sh "$image" "$evidence"
docker run --rm --entrypoint /app/caddy "$image" list-modules > "$evidence/modules.txt"
for module in dns.providers.cloudflare dns.providers.njalla http.handlers.rate_limit; do
  grep -Fx "$module" "$evidence/modules.txt"
done
name="caddy-smoke-${GITHUB_RUN_ID:-local}-${RANDOM}"
cleanup() {
  docker logs "$name" > "$evidence/caddy.log" 2>&1 || true
  docker rm -f "$name" >/dev/null 2>&1 || true
}
trap cleanup EXIT
docker run --detach --name "$name" --tmpfs /config -e VPN_ENABLED=false "$image"
ready=false
for _ in {1..60}; do
  if docker exec "$name" curl -fsS http://127.0.0.1:8080/ > "$evidence/http.html"; then ready=true; break; fi
  sleep 1
done
test "$ready" = true
grep -qi caddy "$evidence/http.html"
docker exec "$name" /app/caddy validate --config /config/Caddyfile --adapter caddyfile
docker exec "$name" sh -ec 'test "$(stat -c %u /config/logs)" = 1000; test -f /config/Caddyfile'
printf 'Three custom modules, valid configuration, HTTP200 and log directory ownership passed.\n' >> "$evidence/result.txt"
