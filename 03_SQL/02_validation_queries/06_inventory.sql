-- ==========================================
-- Blinkit Business Analytics
-- Inventory Table
-- ==========================================

CREATE TABLE inventory (
    product_id INT NOT NULL,
    inventory_date varchar(20),
    stock_received INT NOT NULL,
    damaged_stock INT NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

--  =========================================
-- Validation Queries
-- ==========================================

SELECT *
FROM inventory;

SELECT product_id,
       inventory_date,
       COUNT(*) AS duplicate_count
FROM inventory
GROUP BY product_id, inventory_date
HAVING COUNT(*) > 1;

SELECT *
FROM inventory
WHERE product_id IS NULL;

SELECT *
FROM inventory
WHERE inventory_date IS NULL;

SELECT *
FROM inventory
WHERE stock_received < 0;

SELECT *
FROM inventory
WHERE damaged_stock < 0;

SELECT *
FROM inventory
WHERE inventory_date NOT REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$';

SELECT stock_received,
       COUNT(*) AS total
FROM inventory
GROUP BY stock_received
ORDER BY stock_received;

SELECT damaged_stock,
       COUNT(*) AS total
FROM inventory
GROUP BY damaged_stock
ORDER BY damaged_stock;

SELECT COUNT(*) AS total_inventory_records
FROM inventory;

SELECT i.product_id
FROM inventory i
LEFT JOIN products p
ON i.product_id = p.product_id
WHERE p.product_id IS NULL;

SELECT *
FROM inventory
WHERE damaged_stock > stock_received;

UPDATE inventory
SET inventory_date = STR_TO_DATE(inventory_date, '%d-%m-%Y');

ALTER TABLE inventory
MODIFY inventory_date DATE;

DESCRIBE inventory;
