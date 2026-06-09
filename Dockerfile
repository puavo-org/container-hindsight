FROM ghcr.io/vectorize-io/hindsight:latest

USER root

ARG HINDSIGHT_CONTAINER_UID=1000
ARG HINDSIGHT_CONTAINER_GID=1000

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN uv pip install --python /app/api/.venv/bin/python --no-cache 'hindsight-api-slim[local-llm]'

RUN groupmod -o -g "${HINDSIGHT_CONTAINER_GID}" hindsight \
    && usermod -o -u "${HINDSIGHT_CONTAINER_UID}" -g "${HINDSIGHT_CONTAINER_GID}" hindsight \
    && chown -R hindsight:hindsight /home/hindsight

ENV HINDSIGHT_API_ENABLE_OBSERVATIONS=true

USER hindsight
