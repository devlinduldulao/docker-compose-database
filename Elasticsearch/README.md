# Elasticsearch (Docker Compose)

## Start

```zsh
docker-compose up -d
```

Wait until healthy:

```zsh
curl http://localhost:9200/_cluster/health?pretty
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

- API: http://localhost:9200
- Transport: localhost:9300

## Quick Verification

```zsh
curl http://localhost:9200
curl http://localhost:9200/_cluster/health?pretty
```

## Notes

- This setup runs a single-node local cluster.
- Security is disabled for local development convenience.
- Data is persisted in the named volume `elasticsearch-data`.
- Heap is set to 512 MB for faster startup on demo laptops.

## Sample Requests

See `query.http` for index/create/search/delete examples.
