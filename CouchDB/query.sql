-- Quick demo commands for CouchDB (run as HTTP requests)
-- Default credentials from docker-compose: admin / example

-- Create database
PUT http://admin:example@localhost:5984/demo_products

-- Insert document
POST http://admin:example@localhost:5984/demo_products
Content-Type: application/json

{
	"name": "Mechanical Keyboard",
	"category": "electronics",
	"price": 89.99,
	"in_stock": true
}

-- List all docs (with full document content)
GET http://admin:example@localhost:5984/demo_products/_all_docs?include_docs=true

-- Delete database
DELETE http://admin:example@localhost:5984/demo_products

