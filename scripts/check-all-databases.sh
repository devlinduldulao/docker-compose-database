#!/usr/bin/env bash
set -euo pipefail

check() {
  local name="$1"
  local cmd="$2"
  if eval "$cmd" >/dev/null 2>&1; then
    echo "${name}: OK"
  else
    echo "${name}: FAIL"
  fi
}

check "CouchDB" "curl -fsS http://localhost:5984/_up"
check "Elasticsearch" "curl -fsS http://localhost:9200/_cluster/health"
check "OpenSearch" "curl -fsS http://localhost:9201/_cluster/health"
check "Qdrant" "curl -fsS http://localhost:6333/collections"
check "Weaviate" "curl -fsS http://localhost:8080/v1/.well-known/ready"
check "Redis" "docker exec redis-redis-1 redis-cli ping | grep -q PONG"
check "PostgreSQL" "docker exec postgresql-postgres-1 pg_isready -U postgres -d dev_db | grep -q accepting"
check "MariaDB" "docker exec mariadb-mariadb-1 mariadb-admin ping -uroot -ppass | grep -q alive"
check "MySQL" "docker exec mysql-mysql-1 mysqladmin ping -uroot -ppass | grep -q alive"
check "MongoDB" "docker exec mongodb-mongo-1 mongosh --quiet --eval 'db.adminCommand({ ping: 1 }).ok' | grep -q '^1$'"
check "Microsoft SQL Server" "docker logs --tail 120 microsoft_sql_server-mssql-1 2>&1 | grep -Eq 'ready for client connections|Recovery is complete|SQL Server is now ready'"
