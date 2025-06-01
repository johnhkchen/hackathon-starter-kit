#!/usr/bin/env bash
# Hackbase Developer Setup
# Clone → Copy .env → docker compose up → Build

set -e

# Check essentials only
check_tools() {
    echo "Checking tools..."
    
    if ! command -v docker >/dev/null; then
        echo "❌ Docker required: https://docs.docker.com/get-docker/"
        exit 1
    fi
    
    if ! docker compose version >/dev/null 2>&1; then
        echo "❌ Docker Compose required"
        exit 1
    fi
    
    echo "✅ Tools ready"
}

# Copy environment template
setup_env() {
    echo "Setting up environment..."
    
    if [ ! -f .env.example ]; then
        echo "❌ Missing .env.example file"
        exit 1
    fi
    
    if [ -f .env ]; then
        echo "⚠️  .env already exists"
        return 0
    fi
    
    cp .env.example .env
    echo "✅ Copied .env.example to .env"
    echo "📝 Edit .env with your database URL and API keys"
}

# Test basic setup
test_compose() {
    echo "Testing docker-compose..."
    
    if docker compose config >/dev/null 2>&1; then
        echo "✅ docker-compose.yml valid"
    else
        echo "❌ docker-compose.yml has errors"
        exit 1
    fi
}

main() {
    echo "🚀 Hackbase Developer Setup"
    echo ""
    
    check_tools
    setup_env
    test_compose
    
    echo ""
    echo "🎯 Ready to hack!"
    echo ""
    echo "Next steps:"
    echo "1. Edit .env with your database URL"
    echo "2. Run: docker compose up --build"
    echo "3. Frontend: http://localhost:3000"
    echo "4. Backend: http://localhost:8000"
    echo ""
    echo "That's it. Start building."
}

main "$@"
