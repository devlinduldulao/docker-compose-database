#!/usr/bin/env bash
set -euo pipefail

services=(
  "CouchDB"
  "Elasticsearch"
  "MariaDB"
  "Microsoft_SQL_Server"
  "MongoDB"
  "MySQL"
  "Opensearch"
  "PostgreSQL"
  "Qdrant"
  "Redis"
  "Weaviate"
)

root_dir="$(cd "$(dirname "$0")/.." && pwd)"

for service in "${services[@]}"; do
  echo "=== Starting ${service} ==="
  docker compose -f "${root_dir}/${service}/docker-compose.yml" up -d
  echo
 done

echo "All services started."
