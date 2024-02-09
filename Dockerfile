FROM --platform=linux/arm64 python:3.12.2-slim AS build

RUN pip install poetry==1.7.1
COPY pyproject.toml poetry.lock ./
RUN poetry export -f requirements.txt > requirements.txt

FROM python:3.12.2-slim AS runtime

ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1 \
    DEBIAN_FRONTEND=noninteractive \
    PIP_DEFAULT_TIMEOUT=100 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

# Install the required packages
RUN  apt-get -y update && apt-get -y install zip && rm -rf /var/lib/apt/lists/*

# Install poetry

WORKDIR /app

# Install dependencies
COPY --from=build /requirements.txt /app/requirements.txt
RUN --mount=type=cache,target=/root/.cache python3 -m venv .venv && .venv/bin/pip install --upgrade pip && .venv/bin/pip install -r requirements.txt
COPY build-lambda.sh ./
COPY  app ./app/

# Run the build
CMD [ "bash", "build-lambda.sh" ]