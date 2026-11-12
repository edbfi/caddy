<p align="center">
  <img src="root/app/www/caddy.svg" alt="caddy logo" width="256" height="256">
</p>

<h1 align="center">caddy</h1>

<p align="center"><strong>Caddy container with Cloudflare, Njalla, and rate limiting.</strong></p>

<p align="center">
  <a href="https://github.com/edbfi/caddy/blob/release/LICENSE"><img src="https://img.shields.io/badge/License-GPL--3.0-blue?style=flat" alt="License: GPL-3.0"></a>
  <a href="https://github.com/moby/moby" title="Docker Engine's open-source foundation (Moby)"><img src="https://img.shields.io/badge/Docker-2496ED?style=flat&amp;logo=docker&amp;logoColor=white" alt="Docker"></a>
  <a href="https://github.com/caddyserver/caddy" title="Caddy source"><img src="https://img.shields.io/badge/Caddy-1F88C0?style=flat&amp;logo=caddy&amp;logoColor=white" alt="Caddy"></a>
  <a href="https://git.savannah.gnu.org/cgit/bash.git/" title="GNU Bash source"><img src="https://img.shields.io/badge/Bash-4EAA25?style=flat&amp;logo=gnubash&amp;logoColor=white" alt="Bash"></a>
</p>

Caddy with Cloudflare and Njalla DNS providers and the rate-limit module, derived from hotio/caddy. Documentation: https://web.edb.fi/containers/caddy/.

The image uses the edbfi Alpine VPN base, pinned by the commit tag in meta.json, which call-update keeps current. Caddy follows its latest release through the version call-update records in meta.json. As in hotio/caddy, the Go builder and xcaddy are taken at their latest versions on every build, and every module, including Njalla, at its latest release. Logs live under /config/logs. The hotio runtime account, configuration path, ports 8080/8443 and CUSTOM_BUILD support are retained. No retired personal Njalla fork is required.

GPL-3.0 license and upstream attribution retained.
