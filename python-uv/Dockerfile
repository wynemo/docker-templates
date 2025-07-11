FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim
# Copy the project into the image
ADD . /app

# Sync the project into a new environment, asserting the lockfile is up to date
WORKDIR /app
RUN uv sync --locked

ENTRYPOINT ["uv", "run", "main.py"]
