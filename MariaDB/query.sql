-- Quick demo script for MariaDB
-- mysql -h 127.0.0.1 -P 3307 -u root -ppass docker_maria

CREATE TABLE IF NOT EXISTS demo_products (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(120) NOT NULL,
	price DECIMAL(10, 2) NOT NULL,
	in_stock BOOLEAN NOT NULL DEFAULT TRUE
);

TRUNCATE TABLE demo_products;

INSERT INTO demo_products (name, price, in_stock)
VALUES
	('Mechanical Keyboard', 89.99, TRUE),
	('Notebook', 4.99, TRUE),
	('Wireless Mouse', 24.99, FALSE);

SELECT * FROM demo_products;

