#!/usr/bin/env bash
# Hackbase Admin Validation
# CI/CD checks for deployment readiness

set -e

EXIT_CODE=0

error() {
    echo "❌ $1"
    EXIT_CODE=1
}

warn() {
    echo "⚠️  $1"
}

ok() {
    echo "✅ $1"
}

# Validate required files exist
check_structure() {
    echo "Checking project structure..."
    
    [ -f docker-compose.yml ] || error "Missing docker-compose.yml"
    [ -f .env.example ] || error "Missing .env.example"
    [ -d compose/ ] || error "Missing compose/ directory"
    [ -d services/ ] || error "Missing services/ directory"
    
    ok "Project structure valid"
}

# Validate environment template
check_env_example() {
    echo "Checking .env.example..."
    
    required_vars=(
        "DATABASE_URL"
        "DOMAIN"
        "TRAEFIK_SSL_EMAIL"
        "CF_API_EMAIL"
        "CF_API_KEY"
        "CLOUDFLARE_TUNNEL_TOKEN"
    )
    
    for var in "${required_vars[@]}"; do
        if ! grep -q "^${var}=" .env.example; then
            error "Missing $var in .env.example"
        fi
    done
    
    ok "Environment template valid"
}

# Test compose files
check_compose() {
    echo "Checking docker-compose configuration..."
    
    if ! docker compose config >/dev/null 2>&1; then
        error "docker-compose.yml syntax error"
        return 1
    fi
    
    # Check for required services
    if ! docker compose config | grep -q "frontend:"; then
        error "Missing frontend service"
    fi
    
    if ! docker compose config | grep -q "backend:"; then
        error "Missing backend service"
    fi
    
    if ! docker compose config | grep -q "traefik:"; then
        error "Missing traefik service"
    fi
    
    ok "Docker Compose configuration valid"
}

# Test build process
test_build() {
    echo "Testing build process..."
    
    # Create minimal .env for testing
    if [ ! -f .env ]; then
        cp .env.example .env
        sed -i 's/your-cloudflare-email@example.com/test@example.com/' .env
        sed -i 's/your-cloudflare-global-api-key/test-key/' .env
        sed -i 's/your-cloudflare-tunnel-token/test-token/' .env
        sed -i 's/postgresql:\/\/user:password@db-host:5432\/dbname/postgresql:\/\/test:test@localhost:5432\/test/' .env
        sed -i 's/yourdomain.com/localhost/' .env
        echo "Created test .env"
    fi
    
    if timeout 120 docker compose build >/dev/null 2>&1; then
        ok "All services build successfully"
    else
        error "Build failed or timed out"
    fi
    
    # Cleanup test .env if we created it
    if grep -q "test@example.com" .env; then
        rm .env
        echo "Removed test .env"
    fi
}

# Generate basic CI workflow
generate_ci() {
    echo "Generating CI configuration..."
    
    mkdir -p .github/workflows
    
    cat > .github/workflows/build.yml << 'EOF'
name: Build Test

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Test build
      run: |
        cp .env.example .env
        sed -i 's/your-cloudflare-email@example.com/test@example.com/' .env
        sed -i 's/your-cloudflare-global-api-key/test-key/' .env
        sed -i 's/your-cloudflare-tunnel-token/test-token/' .env
        sed -i 's/postgresql:\/\/user:password@db-host:5432\/dbname/postgresql:\/\/test:test@localhost:5432\/test/' .env
        sed -i 's/yourdomain.com/localhost/' .env
        docker compose build
EOF
    
    ok "Generated .github/workflows/build.yml"
}

main() {
    echo "🛡️  Hackbase Admin Validation"
    echo ""
    
    check_structure
    check_env_example
    check_compose
    test_build
    generate_ci
    
    echo ""
    if [ $EXIT_CODE -eq 0 ]; then
        echo "✅ All checks passed - ready for CI/CD"
    else
        echo "❌ Issues found - fix errors above"
    fi
    
    exit $EXIT_CODE
}

main "$@"
