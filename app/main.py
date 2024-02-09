from fastapi import FastAPI, APIRouter

app = FastAPI()


@app.get("/")
async def status():
    return {"status": "ok"}


router = APIRouter()


@router.get("/")
async def get_users():
    return {"message": "Users!"}


app.include_router(router, prefix="/users", tags=["users"])
