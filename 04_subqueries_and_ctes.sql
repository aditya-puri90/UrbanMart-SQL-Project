-- SUBQUERIES + CTE

-- Find products whose price is higher than the average product price.

SELECT product_id,product_name,price
FROM products 
WHERE price >
            ( SELECT AVG(price) FROM products);    
            

-- Find customers whose total spending is greater than the average customer spending.

-- (using subquery

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status NOT IN ('Cancelled', 'Returned')
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(total_amount) AS customer_total
        FROM orders
        WHERE order_status NOT IN ('Cancelled', 'Returned')
        GROUP BY customer_id
    ) AS customer_spending
);

-- Find the customer who placed the highest-value order.

SELECT 
    o.order_id,
    c.customer_id,
    c.customer_name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.total_amount = (
    SELECT MAX(total_amount) 
    FROM orders
);

-- Find products that have never been ordered.

SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    p.stock_quantity
FROM products p
WHERE NOT EXISTS (
    SELECT 1 
    FROM order_items oi 
    WHERE oi.product_id = p.product_id
);

-- Find customers who placed at least one order but have no reviews.

SELECT c.*
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
AND NOT EXISTS (
    SELECT 1
    FROM reviews r
    WHERE r.customer_id = c.customer_id
);

-- Use a CTE to calculate total revenue per customer.

WITH CustomerRevenue AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(total_amount) AS total_revenue
    FROM orders
    WHERE order_status NOT IN ('Cancelled', 'Returned')
    GROUP BY customer_id
)
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
COALESCE(cr.total_orders, 0) AS total_orders,
COALESCE(cr.total_revenue, 0.00) AS total_revenue
FROM customers c
LEFT JOIN CustomerRevenue cr ON c.customer_id = cr.customer_id
ORDER BY total_revenue DESC;
     

-- Use a CTE to find monthly revenue.

WITH MonthlyRevenue AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        COUNT(order_id) AS total_orders,
        SUM(total_amount) AS monthly_revenue
    FROM orders
    WHERE order_status NOT IN ('Cancelled', 'Returned')
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT 
    sales_month,
    total_orders,
    monthly_revenue,
    ROUND(monthly_revenue / total_orders, 2) AS avg_order_value
FROM MonthlyRevenue
ORDER BY sales_month;

/*Use multiple CTEs to calculate:

customer
total_orders
total_spending
average_order_value*/

WITH CustomerOrders AS (
    -- Step 1: Aggregate orders per customer
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(total_amount) AS total_spending
    FROM orders
    WHERE order_status NOT IN ('Cancelled', 'Returned')
    GROUP BY customer_id
),
CustomerMetrics AS (
    -- Step 2: Compute average order value per customer
    SELECT 
        customer_id,
        total_orders,
        total_spending,
        ROUND(total_spending / total_orders, 2) AS average_order_value
    FROM CustomerOrders
)
-- Step 3: Combine with all customers to include those with zero orders
SELECT 
    c.customer_id,
    c.customer_name,
COALESCE(m.total_orders, 0) AS total_orders,
COALESCE(m.total_spending, 0.00) AS total_spending,
COALESCE(m.average_order_value, 0.00) AS average_order_value
FROM customers c
LEFT JOIN CustomerMetrics m ON c.customer_id = m.customer_id
ORDER BY total_spending DESC;
