# Weaviate (Docker Compose)

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

- REST API: http://localhost:8080
- gRPC: localhost:50051

## Quick Verification

```zsh
curl http://localhost:8080/v1/.well-known/ready
```

## Demo Reset

```zsh
docker-compose down -v && docker-compose up -d
```

## Sample Requests

```zsh
curl -X POST "http://localhost:8080/v1/schema" \
	-H "Content-Type: application/json" \
	-d '{
		"class": "DemoProduct",
		"vectorizer": "none",
		"properties": [
			{"name": "name", "dataType": ["text"]},
			{"name": "price", "dataType": ["number"]}
		]
	}'

curl -X POST "http://localhost:8080/v1/objects" \
	-H "Content-Type: application/json" \
	-d '{
		"class": "DemoProduct",
		"properties": {"name":"Mechanical Keyboard","price":89.99},
		"vector": [0.1,0.2,0.3,0.4]
	}'

curl -X POST "http://localhost:8080/v1/graphql" \
	-H "Content-Type: application/json" \
	-d '{"query":"{ Get { DemoProduct { name price } } }"}'
```

