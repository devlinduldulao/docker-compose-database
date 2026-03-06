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
with_volumes="${1:-}"

for service in "${services[@]}"; do
  echo "=== Stopping ${service} ==="
  if [[ "$with_volumes" == "--volumes" ]]; then
    docker compose -f "${root_dir}/${service}/docker-compose.yml" down -v
  else
    docker compose -f "${root_dir}/${service}/docker-compose.yml" down
  fi
  echo
 done

if [[ "$with_volumes" == "--volumes" ]]; then
  echo "All services stopped and volumes removed."
else
  echo "All services stopped."
fi
