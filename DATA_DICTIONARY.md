# Data Dictionary

All data in this project is fictional and intended for SQL practice.

## `customers`

| Column | Type | Description |
|---|---|---|
| `customer_id` | INT, PK | Unique customer identifier |
| `customer_name` | VARCHAR(100) | Customer display name |
| `email` | VARCHAR(100), UNIQUE | Email address |
| `phone` | VARCHAR(50) | Contact phone stored as text |
| `city` | VARCHAR(50) | Customer city |
| `state` | VARCHAR(50) | Customer state |
| `signup_date` | DATE | Registration date |
| `customer_type` | VARCHAR(20) | Customer segment such as Regular, Premium, or New |

## `products`

| Column | Type | Description |
|---|---|---|
| `product_id` | INT, PK | Unique product identifier |
| `product_name` | VARCHAR(150) | Product name |
| `category` | VARCHAR(50) | Product category |
| `brand` | VARCHAR(50) | Brand |
| `price` | DECIMAL(10,2) | Current catalogue price |
| `stock_quantity` | INT | Recorded stock quantity |
| `supplier` | VARCHAR(100) | Supplier name |

## `orders`

| Column | Type | Description |
|---|---|---|
| `order_id` | INT, PK | Unique order identifier |
| `customer_id` | INT, FK | Customer who placed the order |
| `order_date` | DATE | Order date |
| `order_status` | VARCHAR(30) | Order state such as Delivered, Shipped, Processing, Cancelled, or Returned |
| `total_amount` | DECIMAL(10,2) | Recorded order total |

## `order_items`

| Column | Type | Description |
|---|---|---|
| `order_item_id` | INT, PK | Unique order-line identifier |
| `order_id` | INT, FK | Parent order |
| `product_id` | INT, FK | Product on the order line |
| `quantity` | INT | Units purchased |
| `unit_price` | DECIMAL(10,2) | Price per unit at order time |

## `payments`

| Column | Type | Description |
|---|---|---|
| `payment_id` | INT, PK | Unique payment record |
| `order_id` | INT, FK | Related order |
| `payment_date` | DATE | Payment attempt/record date |
| `payment_method` | VARCHAR(30) | UPI, card, net banking, cash on delivery, etc. |
| `payment_amount` | DECIMAL(10,2) | Recorded payment amount |
| `payment_status` | VARCHAR(30) | Completed, Failed, Pending, or Refunded |

## `deliveries`

| Column | Type | Description |
|---|---|---|
| `delivery_id` | INT, PK | Unique delivery record |
| `order_id` | INT, FK | Related order |
| `courier_partner` | VARCHAR(50) | Courier company |
| `shipped_date` | DATE | Date shipped |
| `expected_delivery_date` | DATE | Expected delivery date |
| `actual_delivery_date` | DATE | Actual delivery date; NULL if not delivered |
| `delivery_status` | VARCHAR(30) | Delivery status |

## `reviews`

| Column | Type | Description |
|---|---|---|
| `review_id` | INT, PK | Unique review identifier |
| `order_id` | INT, FK | Related order |
| `customer_id` | INT, FK | Reviewing customer |
| `product_id` | INT, FK | Reviewed product |
| `rating` | INT | Customer rating (intended 1–5) |
| `review_text` | VARCHAR(500) | Review comment |
| `review_date` | DATE | Review date |
