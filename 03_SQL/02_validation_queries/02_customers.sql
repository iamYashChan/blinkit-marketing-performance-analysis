-- ==========================================
-- Customers Table
-- ==========================================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(15),
    address VARCHAR(255),
    area VARCHAR(100),
    pincode CHAR(6),
    registration_date VARCHAR(10),
    customer_segment VARCHAR(20) NOT NULL,
    total_orders INT NOT NULL,
    avg_order_value DECIMAL(10 , 2 ) NOT NULL
);

--  =========================================
-- Validation Queries
-- ==========================================

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT *
FROM customers
WHERE customer_id IS NULL;

SELECT *
FROM customers
WHERE customer_name IS NULL;

SELECT
MIN(registration_date),
MAX(registration_date)
FROM customers;

SELECT
customer_segment,
COUNT(*) AS total
FROM customers
GROUP BY customer_segment;

SELECT *
FROM customers
WHERE total_orders < 0;

SELECT *
FROM customers
WHERE avg_order_value < 0;

SELECT COUNT(*) AS total_customers
FROM customers;
