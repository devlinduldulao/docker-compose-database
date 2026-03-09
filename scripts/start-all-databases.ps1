$ErrorActionPreference = 'Stop'

$services = @(
  'CouchDB'
  'Elasticsearch'
  'MariaDB'
  'Microsoft_SQL_Server'
  'MongoDB'
  'MySQL'
  'Opensearch'
  'PostgreSQL'
  'Qdrant'
  'Redis'
  'Weaviate'
)

$rootDir = Split-Path -Parent $PSScriptRoot

foreach ($service in $services) {
  Write-Host "=== Starting $service ==="
  $composeFile = Join-Path $rootDir "$service/docker-compose.yml"
  docker compose -f $composeFile up -d
  if ($LASTEXITCODE -ne 0) {
    throw "Failed to start service: $service"
  }
  Write-Host
}

Write-Host 'All services started.'
