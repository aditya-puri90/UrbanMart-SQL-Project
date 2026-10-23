-- UrbanMart database schema
-- Target platform: MySQL 8.0+
-- Run this file first, then run 02_insert_sample_data.sql.
-- If rerunning from scratch, drop the existing database manually first.

CREATE DATABASE urbanmart;

USE urbanmart;

-- Create customers table

CREATE TABLE customers(
      customer_id INT PRIMARY KEY,
      customer_name VARCHAR(100) NOT NULL,
      email VARCHAR(100) UNIQUE NOT NULL,
      phone VARCHAR(50),
      city VARCHAR(50),
      state VARCHAR(50),
      signup_date DATE,
      customer_type VARCHAR(20)
);

CREATE TABLE products(
  product_id INT PRIMARY KEY,
  product_name VARCHAR(150) NOT NULL,
  category VARCHAR(50),
  brand VARCHAR(50),
  price DECIMAL(10,2),
  stock_quantity INT,
  supplier VARCHAR(100)
);

CREATE TABLE orders(
     order_id INT PRIMARY KEY,
     customer_id INT,
     order_date DATE,
     order_status VARCHAR(30),
     total_amount DECIMAL(10,2),
     
     FOREIGN KEY (customer_id)
       REFERENCES customers(customer_id)
       );
       
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
     
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_amount DECIMAL(10,2),
    payment_status VARCHAR(30),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    courier_partner VARCHAR(50),
    shipped_date DATE,
    expected_delivery_date DATE,
    actual_delivery_date DATE,
    delivery_status VARCHAR(30),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    product_id INT,
    rating INT,
    review_text VARCHAR(500),
    review_date DATE,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
