# Docker Compose Database Collection

This repository provides ready-to-use Docker Compose configurations for popular databases and vector stores. Each service is self-contained with sample queries and usage instructions, making it easy to spin up local development environments for learning, testing, or prototyping.

## Included Services

- **CouchDB**
- **Elasticsearch**
- **MariaDB**
- **Microsoft SQL Server**
- **MongoDB**
- **MySQL**
- **OpenSearch**
- **PostgreSQL**
- **Qdrant**
- **Redis**
- **Weaviate**

## Project Structure

```
<service>/
  ├─ docker-compose.yml      # Service-specific Docker Compose file
  ├─ query.sql / README.md   # Sample queries and documentation
  └─ ...                    # Additional resources
```

## Quick Start

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/docker-compose-database.git
   cd docker-compose-database
   ```
2. **Start a service:**
   ```sh
   cd <ServiceName>
   docker-compose up -d
   ```
3. **Stop a service:**
   ```sh
   docker-compose down
   ```

## Windows Quick Start

If you are using PowerShell Core on Windows, use the PowerShell scripts from the repository root:

```powershell
.\scripts\start-all-databases.ps1
.\scripts\check-all-databases.ps1
.\scripts\stop-all-databases.ps1
```

To remove volumes as well:

```powershell
.\scripts\stop-all-databases.ps1 -Volumes
```

If script execution is restricted on Windows, run the scripts with:

```powershell
pwsh -ExecutionPolicy Bypass -File .\scripts\start-all-databases.ps1
```

## Orchestrate Services From Root

This repository now includes a root-level `docker-compose.yml` with a `search` profile for Elasticsearch and OpenSearch.

Start both search services from bash or PowerShell:

```sh
docker compose --profile search up -d
```

Stop them from bash or PowerShell:

```sh
docker compose --profile search down
```

## Run All Databases For Demos

From the repository root:

Linux/macOS (bash):

```sh
bash scripts/start-all-databases.sh
```

Windows (PowerShell Core):

```powershell
.\scripts\start-all-databases.ps1
```

Quick health check:

Linux/macOS (bash):

```sh
bash scripts/check-all-databases.sh
```

Windows (PowerShell Core):

```powershell
.\scripts\check-all-databases.ps1
```

Stop all services:

Linux/macOS (bash):

```sh
bash scripts/stop-all-databases.sh
```

Windows (PowerShell Core):

```powershell
.\scripts\stop-all-databases.ps1
```

Stop all services and remove volumes for a clean slate:

Linux/macOS (bash):

```sh
bash scripts/stop-all-databases.sh --volumes
```

Windows (PowerShell Core):

```powershell
.\scripts\stop-all-databases.ps1 -Volumes
```

## Best Practices
- Each service uses named volumes for data persistence.
- Environment variables are used for configuration (see each service's README).
- Healthchecks and restart policies are included where possible.

## Contributing
Pull requests and issues are welcome! Please ensure your contributions follow best practices and include documentation.

## License
[MIT](LICENSE) 