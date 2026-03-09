param(
  [switch]$Volumes
)

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
  Write-Host "=== Stopping $service ==="
  $composeFile = Join-Path $rootDir "$service/docker-compose.yml"
  $args = @('compose', '-f', $composeFile, 'down')
  if ($Volumes) {
    $args += '-v'
  }

  & docker @args
  if ($LASTEXITCODE -ne 0) {
    throw "Failed to stop service: $service"
  }
  Write-Host
}

if ($Volumes) {
  Write-Host 'All services stopped and volumes removed.'
} else {
  Write-Host 'All services stopped.'
}
