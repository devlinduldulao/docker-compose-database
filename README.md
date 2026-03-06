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

## Orchestrate Services From Root

This repository now includes a root-level `docker-compose.yml` with a `search` profile for Elasticsearch and OpenSearch.

Start both search services:

```sh
docker compose --profile search up -d
```

Stop them:

```sh
docker compose --profile search down
```

## Run All Databases For Demos

From the repository root:

```sh
bash scripts/start-all-databases.sh
```

Quick health check:

```sh
bash scripts/check-all-databases.sh
```

Stop all services:

```sh
bash scripts/stop-all-databases.sh
```

Stop all services and remove volumes for a clean slate:

```sh
bash scripts/stop-all-databases.sh --volumes
```

## Best Practices
- Each service uses named volumes for data persistence.
- Environment variables are used for configuration (see each service's README).
- Healthchecks and restart policies are included where possible.

## Contributing
Pull requests and issues are welcome! Please ensure your contributions follow best practices and include documentation.

## License
[MIT](LICENSE) 