-- Quick demo script for PostgreSQL
-- psql -h localhost -U postgres -d dev_db

CREATE TABLE IF NOT EXISTS demo_products (
	id SERIAL PRIMARY KEY,
	name VARCHAR(120) NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	in_stock BOOLEAN NOT NULL DEFAULT TRUE
);

TRUNCATE TABLE demo_products RESTART IDENTITY;

INSERT INTO demo_products (name, price, in_stock)
VALUES
	('Mechanical Keyboard', 89.99, TRUE),
	('Notebook', 4.99, TRUE),
	('Wireless Mouse', 24.99, FALSE);

SELECT * FROM demo_products;

