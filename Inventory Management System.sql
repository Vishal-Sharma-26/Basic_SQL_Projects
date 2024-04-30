-- Create Database
CREATE DATABASE InventoryManagementSystem

-- Table schema for products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    quantity_in_stock INT
)

-- Table schema for suppliers
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(100),
    email VARCHAR(100)
)

-- Table schema for purchases
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY,
    product_id INT,
    supplier_id INT,
    purchase_date DATE,
    quantity_purchased INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
)

-- Sample data for products
INSERT INTO products (product_id, product_name, category, price, quantity_in_stock) VALUES
(1, 'Laptop', 'Electronics', 1000.00, 10),
(2, 'Smartphone', 'Electronics', 500.00, 20)

-- Sample data for suppliers
INSERT INTO suppliers (supplier_id, supplier_name, contact_person, email) VALUES
(1, 'ABC Electronics', 'John Doe', 'john.doe@example.com'),
(2, 'XYZ Gadgets', 'Jane Smith', 'jane.smith@example.com')

-- Sample data for purchases
INSERT INTO purchases (purchase_id, product_id, supplier_id, purchase_date, quantity_purchased, unit_price) VALUES
(1, 1, 1, '2024-04-01', 5, 900.00),
(2, 2, 2, '2024-04-15', 10, 450.00)

-- Sample SQL queries
-- Select all products below reorder level
SELECT *
FROM products
WHERE quantity_in_stock < 10

-- Select total purchases amount for a specific product
SELECT product_name, SUM(quantity_purchased * unit_price) AS total_purchases_amount
FROM purchases p
JOIN products pr ON p.product_id = pr.product_id
WHERE pr.product_id = 1
