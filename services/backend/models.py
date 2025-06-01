"""Pydantic models."""
from datetime import datetime
from typing import Optional
from pydantic import BaseModel


class HealthResponse(BaseModel):
    status: str
    timestamp: datetime
    version: str


class ItemBase(BaseModel):
    name: str
    description: Optional[str] = None


class ItemCreate(ItemBase):
    pass


class ItemResponse(ItemBase):
    id: int
    created_at: datetime
