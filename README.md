<p align="center">
  <img src="root/app/www/caddy.svg" alt="caddy logo" width="160" height="160">
</p>

<h1 align="center">caddy</h1>

<p align="center"><strong>Caddy container with Cloudflare, Njalla, and rate limiting.</strong></p>

<p align="center">
  <a href="https://github.com/edbfi/caddy/blob/release/LICENSE"><img src="https://img.shields.io/badge/License-GPL--3.0-blue?style=flat" alt="License: GPL-3.0"></a>
  <a href="https://github.com/moby/moby" title="Docker Engine's open-source foundation (Moby)"><img src="https://img.shields.io/badge/Docker-2496ED?style=flat&amp;logo=docker&amp;logoColor=white" alt="Docker"></a>
  <a href="https://github.com/caddyserver/caddy" title="Caddy source"><img src="https://img.shields.io/badge/Caddy-1F88C0?style=flat&amp;logo=caddy&amp;logoColor=white" alt="Caddy"></a>
  <a href="https://git.savannah.gnu.org/cgit/bash.git/" title="GNU Bash source"><img src="https://img.shields.io/badge/Bash-4EAA25?style=flat&amp;logo=gnubash&amp;logoColor=white" alt="Bash"></a>
  <a href="https://github.com/edbfi/caddy/actions/workflows/call-build.yml?query=branch%3Arelease"><img src="https://img.shields.io/github/actions/workflow/status/edbfi/caddy/call-build.yml?branch=release&amp;event=push&amp;label=CI&amp;style=flat" alt="CI"></a>
</p>

Based on [hotio/caddy](https://github.com/hotio/caddy), with Cloudflare and Njalla DNS providers and the rate-limit module.

[Documentation and examples](https://web.edb.fi/containers/caddy/).

Caddy runs as the `hotio` account with configuration under `/config` and logs under `/config/logs`. The image exposes ports 8080/8443 and supports `CUSTOM_BUILD` for a custom Caddy binary.
