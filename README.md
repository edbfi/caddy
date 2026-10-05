# Caddy container

Caddy with Cloudflare and Njalla DNS providers and the rate-limit module, derived from hotio/caddy. Documentation: https://web.edb.fi/containers/caddy/.

The image uses the edbfi Alpine VPN base, pinned by the commit tag in meta.json, which call-update keeps current. Caddy follows its latest release through the version call-update records in meta.json. As in hotio/caddy, the Go builder and xcaddy are taken at their latest versions on every build, and every module, including Njalla, at its latest release. Logs live under /config/logs. The hotio runtime account, configuration path, ports 8080/8443 and CUSTOM_BUILD support are retained. No retired personal Njalla fork is required.

GPL-3.0 license and upstream attribution retained.
