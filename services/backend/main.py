"""FastAPI application."""
import os
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from routes import health, items

# Simple settings
DEBUG = os.getenv("NODE_ENV", "development") == "development"
CORS_ORIGINS = [
    "http://localhost:3000",
    "http://127.0.0.1:3000",
]

# Create app
app = FastAPI(title="Hackbase API", version="1.0.0")

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=CORS_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include routes
app.include_router(health.router)
app.include_router(items.router, prefix="/api/v1")

@app.get("/")
async def root():
    return {"message": "Hackbase API", "docs": "/docs", "health": "/health"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000, reload=True)
