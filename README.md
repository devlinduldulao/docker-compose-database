# Docker Compose Database Collection

This repository provides ready-to-use Docker Compose configurations for popular databases and vector stores. Each service is self-contained with sample queries and usage instructions, making it easy to spin up local development environments for learning, testing, or prototyping.

## Included Services

- **CouchDB**
- **MariaDB**
- **Microsoft SQL Server**
- **MongoDB**
- **MySQL**
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

## Orchestrate All Services (Optional)
You can create a root-level `docker-compose.yml` to run multiple services at once. (Not included by default to avoid port conflicts.)

## Best Practices
- Each service uses named volumes for data persistence.
- Environment variables are used for configuration (see each service's README).
- Healthchecks and restart policies are included where possible.

## Contributing
Pull requests and issues are welcome! Please ensure your contributions follow best practices and include documentation.

## License
[MIT](LICENSE) 