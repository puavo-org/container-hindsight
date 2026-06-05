# SPDX-License-Identifier: MIT
# Copyright (C) Opinsys Oy 2026

_default:
    @just --list

llamacpp:
    @printf '%s\n' \
        "HINDSIGHT_CONTAINER_UID=$(id -u)" \
        "HINDSIGHT_CONTAINER_GID=$(id -g)" \
        'HINDSIGHT_API_LLM_PROVIDER=llamacpp' \
        'HINDSIGHT_API_LLM_MODEL=gpt-oss-20b' \
        'HINDSIGHT_API_RETAIN_LLM_PROVIDER=llamacpp' \
        'HINDSIGHT_API_RETAIN_LLM_MODEL=gpt-oss-20b' \
        'HINDSIGHT_API_REFLECT_LLM_PROVIDER=llamacpp' \
        'HINDSIGHT_API_REFLECT_LLM_MODEL=gpt-oss-20b' \
        'HINDSIGHT_API_CONSOLIDATION_LLM_PROVIDER=llamacpp' \
        'HINDSIGHT_API_CONSOLIDATION_LLM_MODEL=gpt-oss-20b' \
        'HINDSIGHT_API_LLAMACPP_MODEL_PATH=/home/hindsight/.hindsight/models/gpt-oss-20b-mxfp4.gguf' \
        'HINDSIGHT_API_LLAMACPP_GPU_LAYERS=0' \
        'HINDSIGHT_API_LLAMACPP_CONTEXT_SIZE=16384' \
        'HINDSIGHT_API_LLAMACPP_EXTRA_ARGS=--n_threads 8' \
        'HINDSIGHT_API_RETAIN_MAX_COMPLETION_TOKENS=8192' \
        'HINDSIGHT_API_LLM_MAX_CONCURRENT=1' \
        'HINDSIGHT_API_LLM_TIMEOUT=900' \
        'HINDSIGHT_API_ENABLE_OBSERVATIONS=true' \
        'HINDSIGHT_API_WORKER_ID=hindsight-local' > .env

openrouter $OPENROUTER_API_KEY=env_var('OPENROUTER_API_KEY'):
    @printf '%s\n' \
        "HINDSIGHT_CONTAINER_UID=$(id -u)" \
        "HINDSIGHT_CONTAINER_GID=$(id -g)" \
        'HINDSIGHT_API_LLM_PROVIDER=openrouter' \
        "HINDSIGHT_API_LLM_API_KEY=$OPENROUTER_API_KEY" \
        'HINDSIGHT_API_LLM_MODEL=openai/gpt-oss-20b' \
        'HINDSIGHT_API_RETAIN_LLM_PROVIDER=openrouter' \
        'HINDSIGHT_API_RETAIN_LLM_MODEL=openai/gpt-oss-20b' \
        'HINDSIGHT_API_REFLECT_LLM_PROVIDER=openrouter' \
        'HINDSIGHT_API_REFLECT_LLM_MODEL=openai/gpt-oss-120b' \
        'HINDSIGHT_API_CONSOLIDATION_LLM_PROVIDER=openrouter' \
        'HINDSIGHT_API_CONSOLIDATION_LLM_MODEL=openai/gpt-oss-20b' \
        'HINDSIGHT_API_LLM_EXTRA_BODY={"reasoning":{"effort":"low","exclude":true}}' \
        'HINDSIGHT_API_LLM_MAX_CONCURRENT=2' \
        'HINDSIGHT_API_LLM_TIMEOUT=300' \
        'HINDSIGHT_API_ENABLE_OBSERVATIONS=true' \
        'HINDSIGHT_API_WORKER_ID=hindsight-local' > .env
