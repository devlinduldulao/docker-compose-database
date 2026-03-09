$ErrorActionPreference = 'Stop'

function Test-Service {
  param(
    [string]$Name,
    [scriptblock]$Probe
  )

  try {
    $ok = & $Probe
    if ($ok) {
      Write-Host "$Name`: OK"
    } else {
      Write-Host "$Name`: FAIL"
    }
  } catch {
    Write-Host "$Name`: FAIL"
  }
}

Test-Service -Name 'CouchDB' -Probe {
  $null = Invoke-WebRequest -Uri 'http://localhost:5984/_up' -UseBasicParsing
  return $true
}

Test-Service -Name 'Elasticsearch' -Probe {
  $null = Invoke-WebRequest -Uri 'http://localhost:9200/_cluster/health' -UseBasicParsing
  return $true
}

Test-Service -Name 'OpenSearch' -Probe {
  $null = Invoke-WebRequest -Uri 'http://localhost:9201/_cluster/health' -UseBasicParsing
  return $true
}

Test-Service -Name 'Qdrant' -Probe {
  $null = Invoke-WebRequest -Uri 'http://localhost:6333/collections' -UseBasicParsing
  return $true
}

Test-Service -Name 'Weaviate' -Probe {
  $null = Invoke-WebRequest -Uri 'http://localhost:8080/v1/.well-known/ready' -UseBasicParsing
  return $true
}

Test-Service -Name 'Redis' -Probe {
  $output = docker exec redis-redis-1 redis-cli ping 2>$null
  return ($output -match 'PONG')
}

Test-Service -Name 'PostgreSQL' -Probe {
  $output = docker exec postgresql-postgres-1 pg_isready -U postgres -d dev_db 2>$null
  return ($output -match 'accepting')
}

Test-Service -Name 'MariaDB' -Probe {
  $output = docker exec mariadb-mariadb-1 mariadb-admin ping -uroot -ppass 2>$null
  return ($output -match 'alive')
}

Test-Service -Name 'MySQL' -Probe {
  $output = docker exec mysql-mysql-1 mysqladmin ping -uroot -ppass 2>$null
  return ($output -match 'alive')
}

Test-Service -Name 'MongoDB' -Probe {
  $output = docker exec mongodb-mongo-1 mongosh --quiet --eval "db.adminCommand({ ping: 1 }).ok" 2>$null
  return ($output -match '^1\s*$')
}

Test-Service -Name 'Microsoft SQL Server' -Probe {
  $output = docker logs --tail 120 microsoft_sql_server-mssql-1 2>&1
  return ($output -match 'ready for client connections|Recovery is complete|SQL Server is now ready')
}
