-- LEVEL 1: BASIC SQL
-- Run after loading the sample data.

SELECT * FROM customers;
SELECT * FROM products;

-- DISPLAY TABLE INFO

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;
SELECT * FROM deliveries;
SELECT * FROM reviews;

-- LEVEL 1 -Basic SQL

-- Display customers from Pune.

SELECT * FROM customers WHERE city = 'Pune';

-- Find all Premium customers.

SELECT * FROM customers WHERE customer_type = 'Premium';

-- Display products costing more than ₹1,000.

SELECT * FROM products WHERE price > 1000;

-- Display products belonging to Electronics.

SELECT * FROM products WHERE category = 'Electronics';

-- Find orders placed after June 15, 2025.

SELECT * FROM orders WHERE order_date > '2025-06-15';

-- Find cancelled orders.

SELECT * FROM orders WHERE order_status ='Cancelled';

-- Find products having stock less than 80.

SELECT * FROM products WHERE stock_quantity < 80;

-- Sort products by price from highest to lowest.

SELECT * FROM products ORDER BY price DESC;

-- Find the 5 most expensive products.

SELECT * FROM products ORDER BY price DESC LIMIT 5;
