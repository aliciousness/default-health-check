# default-health-check
[![Docker Pulls](https://img.shields.io/badge/Docker%20Pulls-1321-blue)](https://hub.docker.com/r/aliciousness/health-check)
[![Latest Release](https://img.shields.io/badge/release-v2.0.5-brightgreen)](https://github.com/aliciousness/ACTION-latest-release-badge/releases)
[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/aliciousness)
<!-- [![Docker Image Size (tag)]() -->
<!-- ![Build Status](https://img.shields.io/github/actions/workflow/status/aliciousness/default-health-check/release.yml?branch=main)]
[![GitHub last commit](https://img.shields.io/badge/Last%20Commit-2024-11-08-yellow)] -->

A minimal Docker image that provides a configurable health check endpoint and a simple maintenance page. Based on `nginxinc/nginx-unprivileged`.

## Overview

This image runs nginx with:
- A configurable health check endpoint that returns `200 "healthy\n"`
- A static "Site under maintenance" landing page served at `/`
- Configurable listen port (defaults to `80`)

Useful as a lightweight placeholder or default backend that satisfies orchestrator health checks (Docker, Kubernetes, etc.).

## Installation

```sh
git clone https://github.com/aliciousness/default-health-check.git
```

## Environment Variables

|      Variable       | Description                        | Default   |
|:-------------------:|------------------------------------|-----------|
|       `PORT`        | Port nginx listens on              | `80`      |
| `HEALTH_CHECK_PATH` | Path for the health check endpoint | `/health` |

> **Note:** Setting `HEALTH_CHECK_PATH` to `/` is not supported and will fall back to `/health`.

## Usage

### Docker Run

```sh
docker run -p 8080:80 aliciousness/default-health-check
```

### Docker Compose

```yaml
services:
  health-check:
    image: aliciousness/default-health-check:latest
    ports:
      - 8080:80
    environment:
      PORT: 80
      HEALTH_CHECK_PATH: /health
```

### Custom Port and Path

```sh
docker run -p 9090:9090 \
  -e PORT=9090 \
  -e HEALTH_CHECK_PATH=/status \
  aliciousness/default-health-check
```

### Verify

```sh
curl http://localhost:8080/health
# healthy
```

## How It Works

The entrypoint script generates an nginx config at runtime using the `PORT` and `HEALTH_CHECK_PATH` environment variables, then starts nginx in the foreground.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
