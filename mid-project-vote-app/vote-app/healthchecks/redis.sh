#!/bin/sh
set -e

# الافتراض: Redis host داخل نفس الشبكة
HOST="${REDIS_HOST:-127.0.0.1}"
PORT="${REDIS_PORT:-6379}"

# التأكد من تثبيت redis-cli
if ! command -v redis-cli >/dev/null 2>&1; then
    echo "redis-cli not found, installing..."
    apk add --no-cache redis
fi

PING=$(redis-cli -h "$HOST" ping || true)

if [ "$PING" = "PONG" ]; then
    exit 0
else
    exit 1
fi

