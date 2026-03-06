# OpenSearch (Docker Compose)

## Start

```zsh
docker-compose up -d
```

Wait until healthy:

```zsh
curl http://localhost:9201/_cluster/health?pretty
```

## Stop

```zsh
docker-compose down
docker-compose down -v
```

Demo reset (clean state every time):

```zsh
docker-compose down -v && docker-compose up -d
```

## Endpoints

- API: http://localhost:9201
- Performance Analyzer: http://localhost:9600

## Quick Verification

```zsh
curl http://localhost:9201
curl http://localhost:9201/_cluster/health?pretty
```

## Notes

- This setup runs a single-node local OpenSearch cluster.
- Security plugin is disabled for local development convenience.
- Data is persisted in the named volume `opensearch-data`.
- Heap is set to 512 MB for faster startup on demo laptops.

## Sample Requests

See `query.http` for index/create/search/delete examples.
