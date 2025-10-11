#!/usr/bin/env bash
set -euo pipefail

TAR_NAME=${1:-portfolio-images.tar}
BACKUP_DIR=~/backups
DB_DIR=~/portfolio_data/server/database

echo "Stopping existing containers (if any)..."
sudo docker stop portfolio_server portfolio_client || true
sudo docker rm portfolio_server portfolio_client || true

echo "Backing up DB (if exists)..."
mkdir -p "$BACKUP_DIR"
if [ -f "$DB_DIR/portfolio.db" ]; then
  TIMESTAMP=$(date +%Y%m%d-%H%M%S)
  cp "$DB_DIR/portfolio.db" "$BACKUP_DIR/portfolio.db.$TIMESTAMP"
  echo "DB backed up to $BACKUP_DIR/portfolio.db.$TIMESTAMP"
else
  echo "No DB file found at $DB_DIR/portfolio.db"
fi

if [ ! -f "$TAR_NAME" ]; then
  echo "Tar $TAR_NAME not found in home directory. Exiting."
  exit 1
fi

echo "Loading images from $TAR_NAME..."
sudo docker load -i "$TAR_NAME"

echo "Starting containers..."
sudo docker run -d --name portfolio_server \
  -p 3001:3001 \
  -v "$DB_DIR":/app/server/database \
  -e PORT=3001 \
  portfolio-server:latest

sudo docker run -d --name portfolio_client \
  -p 80:80 \
  portfolio-client:latest

echo "Deployment finished. Containers started:"
sudo docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
