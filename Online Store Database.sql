-- Online Store
CREATE DATABASE OnlineStore

-- Table schema for products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    quantity_in_stock INT
);

-- Table schema for customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Table schema for orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Table schema for order_items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample data for products
INSERT INTO products (product_id, product_name, price, quantity_in_stock) VALUES
(1, 'Laptop', 1000.00, 10),
(2, 'Smartphone', 500.00, 20);

-- Sample data for customers
INSERT INTO customers (customer_id, first_name, last_name, email) VALUES
(1, 'Alice', 'Smith', 'alice@example.com'),
(2, 'Bob', 'Jones', 'bob@example.com');

-- Sample data for orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 1, '2024-04-30', 1500.00),
(2, 2, '2024-04-30', 1000.00);

-- Sample data for order_items
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1, 1000.00),
(2, 1, 2, 2, 500.00),
(3, 2, 2, 1, 500.00);

-- Sample SQL queries
-- Select all products
SELECT * FROM products;

-- Select total sales amount for each customer
SELECT c.customer_id, c.first_name, c.last_name, SUM(o.total_amount) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
