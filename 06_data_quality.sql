-- LEVEL 7: DATA QUALITY CHECKS
-- These queries identify records to investigate; a returned row is not always a confirmed defect.

-- Q47. Find duplicate customer emails.
-- Note: customers.email has a UNIQUE constraint, so exact duplicate non-NULL emails
-- should be blocked by the schema. This query is still useful on imported/staging data.
SELECT
    LOWER(TRIM(email)) AS normalized_email,
    COUNT(*) AS duplicate_count
FROM customers
WHERE email IS NOT NULL
GROUP BY LOWER(TRIM(email))
HAVING COUNT(*) > 1;

-- Q48. Find orders with missing payment records.
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.total_amount,
    o.order_status
FROM orders o
LEFT JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;

-- Q49. Find orders where payment amount doesn't match order amount.
-- This simple check compares each payment row to the order total.
-- For production data, account for multiple/partial payments, refunds and payment status.
SELECT
    o.order_id,
    o.total_amount AS order_amount,
    p.payment_id,
    p.payment_amount,
    p.payment_status,
    p.payment_amount - o.total_amount AS amount_difference
FROM orders o
INNER JOIN payments p
    ON o.order_id = p.order_id
WHERE p.payment_amount IS NULL
   OR p.payment_amount <> o.total_amount;

-- Q50. Find orders where shipped or actual delivery date is earlier than order date.
SELECT
    o.order_id,
    o.order_date,
    d.shipped_date,
    d.actual_delivery_date,
    d.delivery_status
FROM orders o
INNER JOIN deliveries d
    ON o.order_id = d.order_id
WHERE (d.shipped_date IS NOT NULL AND d.shipped_date < o.order_date)
   OR (d.actual_delivery_date IS NOT NULL AND d.actual_delivery_date < o.order_date);

-- Additional delivery validation: actual delivery before shipment.
SELECT
    delivery_id,
    order_id,
    shipped_date,
    actual_delivery_date
FROM deliveries
WHERE shipped_date IS NOT NULL
  AND actual_delivery_date IS NOT NULL
  AND actual_delivery_date < shipped_date;

-- Q51. Find products with negative or zero stock.
SELECT
    product_id,
    product_name,
    category,
    stock_quantity,
    CASE
        WHEN stock_quantity < 0 THEN 'Invalid negative stock'
        WHEN stock_quantity = 0 THEN 'Out of stock'
    END AS stock_issue
FROM products
WHERE stock_quantity <= 0;

-- Q52. Find orders with no order items.
SELECT
    o.order_id,
    o.order_date,
    o.total_amount,
    o.order_status
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE oi.order_item_id IS NULL;
