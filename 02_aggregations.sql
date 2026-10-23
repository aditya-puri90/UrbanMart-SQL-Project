-- LEVEL 2  Aggregations

-- Find total number of customers.

SELECT COUNT(*) FROM customers;

-- Find total number of products.

SELECT COUNT(*) FROM products;

-- Find average product price.

SELECT AVG(price) FROM products;

-- Find the most expensive product.

SELECT MAX(price) FROM products ;

-- Find total revenue from orders

-- Business revenue excludes cancelled and returned orders.
SELECT SUM(total_amount) AS revenue
FROM orders
WHERE order_status NOT IN ('Cancelled', 'Returned');

-- Find revenue by customer.

SELECT
    customer_id,
    SUM(total_amount) AS revenue
FROM orders
WHERE order_status NOT IN ('Cancelled', 'Returned')
GROUP BY customer_id;

-- Find number of orders by status.

SELECT order_status,COUNT(*) FROM orders GROUP BY order_status;

-- Find number of customers in each city.

SELECT city,COUNT(*) AS customer_count  FROM customers GROUP BY city;

-- Find average order value.

SELECT AVG(total_amount) AS average_order_value
FROM orders
WHERE order_status NOT IN ('Cancelled', 'Returned'); 

-- Find customers who placed more than one order.

SELECT customer_id,COUNT(*) FROM orders GROUP BY customer_id HAVING COUNT(*) > 1;
