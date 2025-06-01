"""FastAPI application."""
import os
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from datetime import datetime
from typing import List, Optional
from pydantic import BaseModel

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
    import os
    
    # Use 0.0.0.0 in Docker, 127.0.0.1 locally
    host = "0.0.0.0" if os.getenv("DOCKER_CONTAINER") else "127.0.0.1"
    
    uvicorn.run(
        "main:app",
        host=host, 
        port=8000, 
        reload=True
    )
