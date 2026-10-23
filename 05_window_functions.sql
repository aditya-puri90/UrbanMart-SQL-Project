-- WINDOW FUNCTION

-- Rank customers based on total spending.

SELECT c.customer_id,c.customer_name,SUM(o.total_amount) AS total_spending,
RANK() OVER(ORDER BY SUM(o.total_amount) DESC) AS spending_rank
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status NOT IN ('Cancelled', 'Returned')
GROUP BY c.customer_id, c.customer_name
ORDER BY spending_rank, c.customer_id;

-- Find the top 3 customers in terms of spending.

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.total_amount) AS total_spending
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE o.order_status NOT IN ('Cancelled', 'Returned')
    GROUP BY
        c.customer_id,
        c.customer_name
),
ranked_customers AS (
    SELECT
        customer_id,
        customer_name,
        total_spending,
        DENSE_RANK() OVER (
            ORDER BY total_spending DESC
        ) AS spending_rank
    FROM customer_spending
)
SELECT
    customer_id,
    customer_name,
    total_spending,
    spending_rank
FROM ranked_customers
WHERE spending_rank <= 3
ORDER BY spending_rank, customer_id;

-- Rank products within each category.

SELECT product_id,product_name,
       category,price,
DENSE_RANK() OVER(PARTITION BY  category 
                  ORDER BY price DESC) AS product_rank
FROM products 
ORDER BY category, product_rank, product_name;


-- Find the second-highest priced product in each category.
WITH ranked_products AS(
SELECT product_id,
	   product_name,
       category, price,
DENSE_RANK() OVER(PARTITION BY category 
ORDER BY price DESC) AS product_rank
FROM products
)
SELECT product_id,
product_name,
category,
price,
product_rank
FROM ranked_products 
WHERE product_rank = 2
ORDER BY category;

-- Calculate running revenue by order date.
WITH daily_revenue AS (
SELECT order_date,
SUM(total_amount) AS daily_revenue
FROM orders
WHERE order_status NOT IN ('Cancelled', 'Returned')
GROUP BY order_date
)
SELECT order_date,
       daily_revenue,
       SUM(daily_revenue) OVER(
       ORDER BY order_date
       ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_revenue
FROM daily_revenue
ORDER BY order_date;

-- Calculate previous order amount for each customer using:LAG()

SELECT 
   customer_id,
   order_id,
   total_amount,
LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS previous_order_amount
FROM orders
ORDER BY customer_id, order_date, order_id;

-- Calculate difference between current order and previous order.

SELECT
      customer_id,
      order_id,
       total_amount,
LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS previous_amt,
    total_amount - LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
    ) AS difference_amt
FROM orders
ORDER BY customer_id, order_date, order_id;

-- Find customers whose latest order amount is greater than their previous order.


WITH customer_orders AS (
    SELECT
        customer_id,
        order_id,
        order_date,
        total_amount,
        LAG(total_amount) OVER (
            PARTITION BY customer_id
            ORDER BY order_date, order_id
        ) AS previous_order_amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date DESC, order_id DESC
        ) AS rn
    FROM orders
)
SELECT
    customer_id,
    order_id AS latest_order_id,
    order_date AS latest_order_date,
    total_amount AS latest_order_amount,
    previous_order_amount
FROM customer_orders
WHERE rn = 1
  AND total_amount > previous_order_amount
ORDER BY customer_id;
