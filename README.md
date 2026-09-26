# Caddy container

Caddy with Cloudflare and Njalla DNS providers and the rate-limit module, derived from hotio/caddy. Documentation: https://web.edb.fi/containers/caddy/.

The image uses the edbfi Alpine VPN base with pinned architecture digests. Caddy remains2.11.4; the Go builder, xcaddy and module revisions are pinned in the Dockerfiles. Logs live under /config/logs. The hotio runtime account, configuration path, ports8080/8443 and CUSTOM_BUILD support are retained. No retired personal Njalla fork is required.

GPL-3.0 license and upstream attribution retained.
