FROM python:3.13-slim AS development

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

WORKDIR /app

# Copy project files
COPY pyproject.toml uv.lock* ./

# Install dependencies
RUN uv sync

# Copy source
COPY . .

EXPOSE 8000

# Set Docker environment variable
ENV DOCKER_CONTAINER=1

# Development with hot reload
CMD ["uv", "run", "python", "main.py"]

# Production stage
FROM python:3.13-slim AS production

COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

WORKDIR /app

COPY pyproject.toml uv.lock* ./
RUN uv sync --no-dev

COPY main.py ./

RUN adduser --system --uid 1001 fastapi
USER fastapi

EXPOSE 8000

# Set Docker environment variable
ENV DOCKER_CONTAINER=1

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

CMD ["uv", "run", "python", "main.py"]
