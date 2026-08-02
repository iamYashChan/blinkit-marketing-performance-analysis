-- ==========================================
-- Blinkit Business Analytics
-- Delivery Performance Table
-- ==========================================

CREATE TABLE delivery_performance (
    order_id BIGINT NOT NULL,
    delivery_partner_id INT NOT NULL,
    promised_time DATETIME NOT NULL,
    actual_time DATETIME NOT NULL,
    delivery_time_minutes INT NOT NULL,
    distance_km DECIMAL(5,2) NOT NULL,
    delivery_status VARCHAR(50) NOT NULL,
    reasons_if_delayed VARCHAR(100),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);
