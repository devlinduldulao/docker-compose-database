# Qdrant (Docker Compose)

## Start

```zsh
docker-compose up -d
```

## Stop

```zsh
docker-compose down
docker-compose down -v
```

## Endpoints

- API: http://localhost:6333

## Quick Verification

```zsh
curl http://localhost:6333/collections
```

## Demo Reset

```zsh
docker-compose down -v && docker-compose up -d
```

## Sample Requests

Use curl directly:

```zsh
curl -X PUT "http://localhost:6333/collections/demo" \
	-H "Content-Type: application/json" \
	-d '{"vectors":{"size":4,"distance":"Cosine"}}'

curl -X PUT "http://localhost:6333/collections/demo/points" \
	-H "Content-Type: application/json" \
	-d '{"points":[{"id":1,"vector":[0.1,0.2,0.3,0.4],"payload":{"name":"item-1"}}]}'

curl -X POST "http://localhost:6333/collections/demo/points/search" \
	-H "Content-Type: application/json" \
	-d '{"vector":[0.1,0.2,0.3,0.4],"limit":3}'
```

