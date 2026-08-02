-- ==========================================
-- Blinkit Business Analytics
-- Orders Table
-- ==========================================

CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date VARCHAR(20),
    promised_delivery_time VARCHAR(20),
    actual_delivery_time VARCHAR(20),
    delivery_status VARCHAR(30) NOT NULL,
    order_total DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    delivery_partner_id INT,
    store_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

--  =========================================
-- Validation Queries
-- ==========================================

SELECT order_id, COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT *
FROM orders
WHERE order_id IS NULL;

SELECT *
FROM orders
WHERE customer_id IS NULL;

SELECT delivery_status,
COUNT(*) AS total
FROM orders
GROUP BY delivery_status;

SELECT *
FROM orders
WHERE order_total < 0;