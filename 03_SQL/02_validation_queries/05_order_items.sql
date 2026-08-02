-- ==========================================
-- Blinkit Business Analytics
-- Order Items Table
-- ==========================================

CREATE TABLE order_items (
    order_id BIGINT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    selling_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

--  =========================================
-- Validation Queries
-- ==========================================

SELECT *
FROM order_items;

SELECT order_id,
       product_id,
       COUNT(*) AS duplicate_count
FROM order_items
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

SELECT *
FROM order_items
WHERE order_id IS NULL;

SELECT *
FROM order_items
WHERE product_id IS NULL;

SELECT *
FROM order_items
WHERE quantity <= 0;

SELECT *
FROM order_items
WHERE selling_price <= 0;

SELECT quantity,
       COUNT(*) AS total
FROM order_items
GROUP BY quantity
ORDER BY quantity;

SELECT COUNT(*) AS total_order_items
FROM order_items;