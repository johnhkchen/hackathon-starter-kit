"""Items CRUD routes."""
from datetime import datetime
from typing import List
from fastapi import APIRouter, HTTPException

from models import ItemCreate, ItemResponse

router = APIRouter()

# In-memory storage
items_db = []
next_id = 1


@router.get("/items", response_model=List[ItemResponse])
async def get_items():
    """Get all items."""
    return items_db


@router.post("/items", response_model=ItemResponse)
async def create_item(item: ItemCreate):
    """Create a new item."""
    global next_id
    
    new_item = ItemResponse(
        id=next_id,
        name=item.name,
        description=item.description,
        created_at=datetime.now()
    )
    
    items_db.append(new_item)
    next_id += 1
    return new_item


@router.get("/items/{item_id}", response_model=ItemResponse)
async def get_item(item_id: int):
    """Get a specific item."""
    for item in items_db:
        if item.id == item_id:
            return item
    
    raise HTTPException(status_code=404, detail="Item not found")


@router.delete("/items/{item_id}")
async def delete_item(item_id: int):
    """Delete an item."""
    global items_db
    
    for i, item in enumerate(items_db):
        if item.id == item_id:
            items_db.pop(i)
            return {"message": f"Item {item_id} deleted", "success": True}
    
    raise HTTPException(status_code=404, detail="Item not found")
