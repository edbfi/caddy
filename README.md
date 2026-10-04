# Caddy container

Caddy with Cloudflare and Njalla DNS providers and the rate-limit module, derived from hotio/caddy. Documentation: https://web.edb.fi/containers/caddy/.

The image uses the edbfi Alpine VPN base, pinned by the commit tag in meta.json, which call-update keeps current. Caddy remains 2.11.7; as in hotio/caddy, the Go builder, xcaddy and the Cloudflare and rate-limit modules are taken at their latest versions on every build, and the Njalla module is pinned at v1.0.0. Logs live under /config/logs. The hotio runtime account, configuration path, ports 8080/8443 and CUSTOM_BUILD support are retained. No retired personal Njalla fork is required.

GPL-3.0 license and upstream attribution retained.
