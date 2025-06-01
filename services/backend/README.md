# Backend API 🚀

**TLDR**: FastAPI server. Run it, add your endpoints, ship it.

## Start Server
```bash
uv run python main.py
```
→ http://localhost:8000 | [Docs](http://localhost:8000/docs)

## File Guide
- `main.py` - App setup (don't change much)
- `models.py` - Data shapes (add your models here)
- `routes/` - Your endpoints go here
- `__pycache__/`, `uv.lock` - Ignore these

## Add Endpoint
1. Create `routes/yourfeature.py`:
```python
from fastapi import APIRouter
router = APIRouter()

@router.get("/your-endpoint")
async def your_function():
    return {"data": "your response"}
```

2. Add to `main.py`:
```python
from routes import health, items, yourfeature
app.include_router(yourfeature.router, prefix="/api/v1")
```

## Add Data Model
In `models.py`:
```python
class YourModel(BaseModel):
    id: int
    name: str
```

## Docker
Works with main compose:
```bash
docker compose up backend --build
```

## Troubleshooting
- **Can't connect?** Check CORS in main.py
- **Import errors?** Run from this directory with `uv run`
- **Port busy?** Change port in main.py

**Ready to hack!** 🎯
