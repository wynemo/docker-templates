
from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    BASE_URL:str = "http://127.0.0.1:8000"


settings = Settings()
