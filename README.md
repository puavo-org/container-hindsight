# Hindsight container

## Generating the environment

The environment generation recipes also prepare the bind-mounted directories and
download the llama.cpp model if it does not already exist.

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
