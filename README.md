# Hindsight container

## Preparation

```
mkdir -p \
  "$HOME/.hindsight/data" \
  "$HOME/.hindsight/cache" \
  "$HOME/.hindsight/models"

touch "$HOME/.hindsight/models/llamacpp_server.log"
chmod 666 "$HOME/.hindsight/models/llamacpp_server.log"

curl -L \
  -o "$HOME/.hindsight/models/gpt-oss-20b-mxfp4.gguf" \
  "https://huggingface.co/ggml-org/gpt-oss-20b-GGUF/resolve/main/gpt-oss-20b-mxfp4.gguf"

docker run --rm --user root \
  -v "$HOME/.hindsight:/mnt" \
  --entrypoint sh ghcr.io/vectorize-io/hindsight:latest \
  -lc 'chown -R 1000:1000 /mnt/data /mnt/cache /mnt/models'
```

The last command makes the bind-mounted directories writable by the
`hindsight` user inside the container.

## Generating the environment

```bash
just llamacpp
```

For OpenRouter, either pass the key explicitly:

```bash
just openrouter sk-or-v1-your-key-here
```

Or read it from the shell environment:

```bash
OPENROUTER_API_KEY=sk-or-v1-your-key-here just openrouter
```

## Bringing up the container

```bash
docker compose up --build
```

## License

`hindsight-container` is licensed under `MIT`. See [LICENSE](LICENSE) for more
information.
