-- ==========================================
-- Blinkit Business Analytics
-- Products Table
-- ==========================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    mrp DECIMAL(10,2) NOT NULL,
    margin_percent INT,
    shelf_life_days INT,
    min_stock_level INT,
    max_stock_level INT
);

--  =========================================
-- Validation Queries
-- ==========================================

SELECT *
FROM products;

SELECT product_id, COUNT(*) AS duplicate_count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

SELECT *
FROM products
WHERE product_id IS NULL;

SELECT *
FROM products
WHERE product_name IS NULL;

SELECT *
FROM products
WHERE price < 0;

SELECT *
FROM products
WHERE mrp < 0;

SELECT *
FROM products
WHERE price > mrp;

SELECT category,
       COUNT(*) AS product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;

SELECT brand,
       COUNT(*) AS product_count
FROM products
GROUP BY brand
ORDER BY product_count DESC;

SELECT COUNT(*) AS total_products
FROM products;