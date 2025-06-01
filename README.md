# Hackathon Starter Kit

> Full-stack development setup with Traefik routing and Cloudflare tunnel for public access.

## What You Get

- **Frontend**: Astro with TypeScript and hot reload
- **Backend**: FastAPI with automatic OpenAPI docs
- **Reverse Proxy**: Traefik with automatic service discovery
- **Public Access**: Cloudflare tunnel with HTTPS

## Quick Start

### Prerequisites
- Docker & Docker Compose
- Cloudflare account with a domain

### Setup Cloudflare Tunnel
```bash
# Install cloudflared
brew install cloudflared

# Authenticate and create tunnel
cloudflared tunnel login
cloudflared tunnel create hackathon
cloudflared tunnel route dns hackathon your-subdomain.yourdomain.com
```

### Configure and Run
```bash
git clone https://github.com/your-org/hackathon-starter-kit.git
cd hackathon-starter-kit

# Set your domain in ~/.cloudflared/container-config.yml
# Update hostname: your-subdomain.yourdomain.com

docker compose up
```

Your app is live at:
- **Frontend**: https://your-subdomain.yourdomain.com
- **API Docs**: https://your-subdomain.yourdomain.com/api/docs
- **Traefik Dashboard**: http://localhost:8080

## Project Structure

```
├── docker-compose.yml           # Main orchestration
├── compose/                     # Service definitions
│   ├── frontend.yml            # Astro frontend
│   ├── backend.yml             # FastAPI backend
│   ├── traefik.yml             # Reverse proxy
│   └── tunnel.yml              # Cloudflare tunnel
├── services/
│   ├── frontend/               # Astro app
│   └── backend/                # FastAPI app
└── traefik.yml                 # Routing configuration
```

## How It Works

**Routing**
- Traefik routes `/api/*` to FastAPI backend (priority 100)
- Everything else goes to Astro frontend (priority 1)
- Path stripping: `/api/docs` becomes `/docs` at the backend

**Public Access**
- Cloudflare tunnel connects localhost:80 to your domain
- Automatic HTTPS certificates
- No port forwarding required

**Development**
- Hot reload works for both frontend and backend
- Changes reflect immediately in the public URL
- Logs available via `docker compose logs`

## Development

```bash
# Start everything
docker compose up

# View logs
docker compose logs -f frontend
docker compose logs -f backend

# Restart a service
docker compose restart backend
```

## Environment Variables

Create `.env` for local configuration:
```bash
NODE_ENV=development
DATABASE_URL=postgresql://user:pass@host:port/db
DOMAIN=your-subdomain.yourdomain.com
```

## Adding Services

Create `compose/your-service.yml`:
```yaml
services:
  your-service:
    image: your-image
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.your-service.rule=PathPrefix(`/your-path`)"
      - "traefik.http.routers.your-service.entrypoints=web"
```

Include it in `docker-compose.yml`:
```yaml
include:
  - path: ./compose/your-service.yml
```

## Deployment

This setup uses Docker Compose and includes a Cloudflare tunnel for external access. For other deployment platforms, you'll need to adapt the configuration.

## Troubleshooting

**Check service discovery**: http://localhost:8080  
**View all logs**: `docker compose logs`  
**Restart everything**: `docker compose down && docker compose up`

