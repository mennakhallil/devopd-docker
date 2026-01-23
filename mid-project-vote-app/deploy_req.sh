#!/bin/bash 

set -e

APP_USER="ubuntu1"

APP_DIR="/home/$APP_USER/mid-project-vote-app"



echo "=== 1. Update system ==="

sudo apt update -y



echo "=== 2. Install required packages ==="

sudo apt install -y \

  ca-certificates \

  curl \

  gnupg \

  lsb-release \

  rsync



echo "=== 3. Install Docker ==="

if ! command -v docker &> /dev/null; then

  curl -fsSL https://get.docker.com | sudo sh

fi



echo "=== 4. Enable Docker ==="

sudo systemctl enable docker

sudo systemctl start docker



echo "=== 5. Add user to docker group ==="

sudo usermod -aG docker "$APP_USER"



echo "=== 6. Verify Docker ==="

docker version

docker info



echo "=== 7. Create Docker volumes ==="

docker volume create postgres-data || true

docker volume create redis-data || true



echo "=== 8. Create project directory ==="

sudo mkdir -p "$APP_DIR"

sudo chown -R "$APP_USER:$APP_USER" "$APP_DIR"



echo "=== 9. Create shell-runner directory (local scripts only) ==="

mkdir -p "$APP_DIR/shell-runner"

chmod 755 "$APP_DIR/shell-runner"
