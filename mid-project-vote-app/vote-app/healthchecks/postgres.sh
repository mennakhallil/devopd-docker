#!/bin/sh
set -e

HOST="${POSTGRES_HOST:-127.0.0.1}"
PORT="${POSTGRES_PORT:-5432}"

# تأكد من وجود netcat
if ! command -v nc >/dev/null 2>&1; then
    echo "Installing netcat..."
    apk add --no-cache netcat-openbsd
fi

# TCP healthcheck
if nc -z "$HOST" "$PORT"; then
    exit 0
else
    exit 1
fi
