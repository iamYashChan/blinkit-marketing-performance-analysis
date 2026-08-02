-- ==========================================
-- Blinkit Business Analytics
-- Customer Feedback Table
-- ==========================================

CREATE TABLE customer_feedback (
    feedback_id BIGINT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    customer_id INT NOT NULL,
    rating INT NOT NULL,
    feedback_text TEXT,
    feedback_category VARCHAR(50),
    sentiment VARCHAR(20),
    feedback_date DATE,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

--  =========================================
-- Validation Queries
-- ==========================================

SELECT * 
FROM customer_feedback;

SELECT feedback_id,
       COUNT(*) AS duplicate_count
FROM customer_feedback
GROUP BY feedback_id
HAVING COUNT(*) > 1;

SELECT *
FROM customer_feedback
WHERE feedback_id IS NULL;

SELECT *
FROM customer_feedback
WHERE order_id IS NULL;

SELECT *
FROM customer_feedback
WHERE customer_id IS NULL;

SELECT *
FROM customer_feedback
WHERE rating IS NULL;

SELECT *
FROM customer_feedback
WHERE rating < 1
   OR rating > 5;
   
SELECT *
FROM customer_feedback
WHERE feedback_date IS NULL;

SELECT sentiment,
       COUNT(*) AS total
FROM customer_feedback
GROUP BY sentiment
ORDER BY total DESC;

SELECT feedback_category,
       COUNT(*) AS total
FROM customer_feedback
GROUP BY feedback_category
ORDER BY total DESC;

SELECT COUNT(*) AS total_feedback_records
FROM customer_feedback;

SELECT cf.order_id
FROM customer_feedback cf
LEFT JOIN orders o
ON cf.order_id = o.order_id
WHERE o.order_id IS NULL;

SELECT cf.customer_id
FROM customer_feedback cf
LEFT JOIN customers c
ON cf.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

SELECT rating,
       COUNT(*) AS total
FROM customer_feedback
GROUP BY rating
ORDER BY rating;

SELECT *
FROM customer_feedback
WHERE sentiment = 'Positive'
  AND rating <= 2;