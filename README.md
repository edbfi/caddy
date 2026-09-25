# Caddy container

Caddy with Cloudflare and Njalla DNS providers and the rate-limit module, derived from hotio/caddy. Documentation: https://web.edb.fi/containers/caddy/.

The image uses the edbfi Alpine VPN base with pinned architecture digests. Caddy remains2.11.4; the Go builder, xcaddy and module revisions are pinned in the Dockerfiles. Logs live under /config/logs. The hotio runtime account, configuration path, ports8080/8443 and CUSTOM_BUILD support are retained. No retired personal Njalla fork is required.

CI builds natively on amd64 and arm64, checks module presence and default startup, validates configuration, serves HTTP and verifies the response and log directory ownership. DNS provider modules are checked for inclusion; no live DNS credentials or certificate issuance are exercised. Publishing is manual after successful CI from the matching release branch and consumes the tested architecture archives. No Docker Hub, Discord or downstream repository write credentials are used.

GPL-3.0 license and upstream attribution retained. Dependency/base updates require reviewed commits and full CI before publishing.

Shared CI and Renovate presets use automation `v4.0.0`. Renovate owns dependency
PR merging through the shared `automerge.json` preset: it arms GitHub auto-merge
with the rebase strategy, preserving commit author sign-offs, and GitHub merges
only after every required check passes. Strict, GitHub Actions-sourced required
CI and PR policy checks must pass on an up-to-date branch; the automated merger
has no bypass. The read-only PR policy check preserves sign-offs, Conventional
Commit titles, reviews and hold labels. Independent policy events run to
completion without cancelling one another; after a pass, policy re-runs the other
event's older failed verdict for the same head. The shared release-age policy
remains active, and Renovate configuration updates require manual merging. The
custom checked merger remains retired.
Native architecture builds and every existing container smoke assertion remain
mandatory; image publication remains an explicit manual operation after CI.
