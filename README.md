# Hackathon Starter Kit 🚀

> **Build first, configure never.** A battle-tested full-stack setup that gets you from idea to deployed app in minutes, not hours.

## Why This Exists

Hackathons should be about building cool stuff with smart people, not fighting with CORS errors at 3 AM. This starter kit handles all the boring parts so you can focus on the fun parts.

**What we handle for you:**
- 🎯 Zero-config full-stack setup
- 🌐 Automatic HTTPS and public URLs
- 🔄 Hot reloading everywhere
- 📱 Mobile preview ready
- 🎨 Modern UI components included
- 🚦 Smart routing that just works
- 📊 Real-time collaboration tools
- 🎮 Fun extras (confetti on deploy!)

---

## Quick Start (2 Minutes)

### 1. Clone and Go
```bash
# Clone the starter
git clone https://github.com/hackathon-starter/kit.git my-awesome-project
cd my-awesome-project

# One-line setup
./setup.sh
```

### 2. Start Building
```bash
docker compose up
```

**That's it!** Your app is live at:
- 🖥️ **App**: http://localhost:3000
- 🔧 **API**: http://localhost:8000/docs
- 📱 **Public URL**: https://your-project.hackathon.live (auto-generated)

---

## Project Structure

```
my-awesome-project/
├── 🎯 docker-compose.yml      # One file to rule them all
├── 📦 services/
│   ├── frontend/              # Your React/Vue/Svelte app
│   │   ├── src/
│   │   ├── public/
│   │   └── Dockerfile
│   ├── backend/               # FastAPI with batteries included
│   │   ├── app/
│   │   ├── tests/
│   │   └── Dockerfile
│   └── shared/                # Shared types & utilities
├── 🔧 compose/                # Service configs (touch only if needed)
│   ├── frontend.yml
│   ├── backend.yml
│   ├── database.yml
│   ├── traefik.yml
│   └── tunnel.yml
├── 🎨 templates/              # UI component library
├── 🚀 .env.example            # Environment template
├── 📖 docs/                   # Recipes & examples
└── 🎮 hackathon.json          # Project metadata
```

---

## Features That Actually Matter

### 🎯 Smart Defaults

Everything is configured with hackathon-friendly defaults:
- **Frontend**: React with Vite, TailwindCSS, and shadcn/ui components
- **Backend**: FastAPI with automatic OpenAPI docs and CORS handled
- **Database**: PostgreSQL with auto-migrations (or SQLite for simplicity)
- **Auth**: Optional JWT auth that works out of the box

### 🌐 Instant Public URLs

No more "it works on my machine" problems:
```bash
# Your app is automatically available at:
https://[your-project-name].hackathon.live

# Share with teammates instantly
# QR code generated in terminal for mobile testing
```

### 🔄 Live Collaboration

Built-in tools for hackathon teams:
- **Live Share**: Real-time code sharing (VS Code Live Share compatible)
- **Shared State**: WebSocket sync for collaborative features
- **Team Chat**: Built-in chat widget for quick communication

### 🎨 UI Kit Included

Stop rebuilding the same components:
```jsx
import { Button, Card, Dialog, Toast } from '@/components/ui'
import { useHackathon } from '@/hooks/hackathon'

function MyApp() {
  const { timeRemaining, submitProject } = useHackathon()
  
  return (
    <Card>
      <h1>Time left: {timeRemaining}</h1>
      <Button onClick={submitProject}>Ship It! 🚀</Button>
    </Card>
  )
}
```

### 📊 Built-in Analytics

Track what matters during your hack:
- Page views and user flows
- API performance metrics
- Error tracking with Sentry
- Custom event tracking

---

## Common Hackathon Scenarios

### "We need user authentication"
```bash
# Enable auth with one command
just enable auth

# Now you have:
# - Login/signup pages
# - JWT tokens
# - Protected routes
# - User management
```

### "We're using AI/ML APIs"
```python
# Built-in AI service wrapper
from app.services.ai import ai_service

# Automatically handles rate limits, retries, and caching
result = await ai_service.complete(
    prompt="Generate a startup idea",
    model="gpt-4"  # or "claude-3", "llama-2", etc.
)
```

### "We need a landing page"
```bash
# Generate a landing page
just generate landing

# Choose from templates:
# - SaaS product
# - Mobile app
# - B2B tool
# - Social platform
```

### "We're integrating with [X] API"
```bash
# Common integrations included
just add integration stripe
just add integration twilio
just add integration sendgrid
just add integration github
```

---

## Team Collaboration

### 🎯 For Team Leads
```bash
# Set up the project for your team
just team setup

# This creates:
# - Shared environment file
# - Team member access
# - Git hooks for consistent commits
# - Automated PR previews
```

### 👥 For Team Members
```bash
# Join an existing project
just team join [invite-code]

# You get:
# - Pre-configured environment
# - Access to shared services
# - Live reload with team changes
```

### 📱 Mobile Developers
```bash
# Expose API for mobile development
just mobile setup

# Provides:
# - Stable local IP for testing
# - Mock data endpoints
# - WebSocket debugging
# - Push notification testing
```

---

## Advanced Features

### 🚀 One-Click Deploy

When you're ready to ship:
```bash
# Deploy to your choice of platform
just deploy vercel
just deploy railway  
just deploy fly
just deploy aws

# Each handles:
# - Environment variables
# - Database migration
# - SSL certificates
# - Monitoring setup
```

### 🔧 Custom Services

Add any service with our templates:
```bash
# Add a new microservice
just add service worker --language=python

# Add a message queue
just add service redis

# Add image processing
just add service imgproxy
```

### 📊 Performance Monitoring

Built-in observability:
- Request tracing across services
- Database query analysis  
- Frontend performance metrics
- Error aggregation

---

## Hackathon Hacks

### ⏰ Time Savers

```bash
# Generate CRUD endpoints from a schema
just generate crud User

# Create admin panel
just add admin

# Add data visualization dashboard
just add dashboard
```

### 🎮 Fun Stuff

```bash
# Add some personality
just enable easter-eggs

# Includes:
# - Konami code handler
# - Confetti on successful deploy
# - Team achievement badges
# - Sound effects (optional)
```

### 🏆 Presentation Mode

```bash
# Optimize for demos
just demo mode

# This:
# - Disables error popups
# - Adds smooth transitions
# - Preloads all assets
# - Enables presenter view
```

---

## Troubleshooting

### "Port already in use"
```bash
just ports fix
# Automatically finds and uses free ports
```

### "Database connection failed"
```bash
just db reset
# Nukes and recreates the database
```

### "My frontend isn't updating"
```bash
just cache clear
# Clears all caches and rebuilds
```

### "Help! Everything is broken!"
```bash
just panic
# Creates a diagnostic report and suggests fixes
```

---

## Best Practices for Hackathons

### 🏃‍♂️ Start Fast
1. Clone the repo
2. Run setup
3. Start coding immediately
4. Configure only what you need

### 🎯 Stay Focused
- Use the included UI components
- Don't optimize early
- Ship features, not perfect code
- Use the mock data generators

### 🤝 Collaborate Smart
- Commit early and often
- Use feature branches
- Tag releases every few hours
- Document as you go (templates included)

### 🚀 Demo Like a Pro
- Use the presentation mode
- Have a backup video ready
- Test on multiple devices
- Practice with bad wifi

---

## What's in the Box?

### Frontend Goodies
- **Frameworks**: React, Vue, Svelte, or vanilla (your choice)
- **Styling**: Tailwind + shadcn/ui + custom animations
- **State**: Zustand for simple, Redux Toolkit for complex
- **Forms**: React Hook Form with validation
- **Tables**: TanStack Table with sorting/filtering
- **Charts**: Recharts with hackathon-friendly defaults

### Backend Magic
- **API**: FastAPI with automatic OpenAPI/Swagger
- **Database**: PostgreSQL/MySQL/SQLite + migrations
- **Cache**: Redis with smart invalidation
- **Queue**: Celery for background jobs
- **Storage**: S3-compatible object storage

### DevOps Done
- **Containers**: Multi-stage builds for tiny images
- **Routing**: Traefik with automatic SSL
- **Tunnels**: Cloudflare for public URLs
- **CI/CD**: GitHub Actions / GitLab CI templates
- **Monitoring**: Grafana + Prometheus setup

---

## Contributing

This project exists because hackathons are awesome and setup is not. Help us make it better!

### Ways to Contribute
- 🐛 Report bugs (especially during hackathons!)
- 📖 Improve documentation
- 🎨 Add UI components
- 🔧 Create new integrations
- 🌟 Share your hackathon success stories

### Development
```bash
# Set up development environment
just dev setup

# Run tests
just test

# Submit changes
just contribute
```

---

## Community

### 💬 Discord
Join our Discord for:
- Real-time help during hackathons
- Feature requests
- Team finding
- Project showcases

[Join Discord](https://discord.gg/hackathon-starter)

### 🏆 Hall of Fame
Projects built with this starter:
- **HealthHub** - Won TechCrunch Disrupt 2024
- **EcoTracker** - Best Sustainability Hack, MIT
- **StudyBuddy** - 1st Place, HackTheNorth
- [Add your project!]

---

## License

MIT - Build whatever you want! If you win something cool, let us know 🎉

---

## One More Thing...

Remember: Hackathons are about having fun and building cool stuff. Don't stress about perfect code or optimal architecture. Focus on your idea, help your teammates, and enjoy the energy of creating something new.

**Happy hacking! 🚀**

*P.S. - If you're reading this at 3 AM during a hackathon, you're doing great. Grab some water and keep building!*
