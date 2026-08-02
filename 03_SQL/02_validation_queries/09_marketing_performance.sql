-- ==========================================
-- Blinkit Business Analytics
-- Marketing Peformance Table
-- ==========================================

CREATE TABLE marketing_performance (
    campaign_id BIGINT PRIMARY KEY,
    campaign_name VARCHAR(100) NOT NULL,
    campaign_date DATE NOT NULL,
    target_audience VARCHAR(50) NOT NULL,
    channel VARCHAR(50) NOT NULL,
    impressions INT NOT NULL,
    clicks INT NOT NULL,
    conversions INT NOT NULL,
    spend DECIMAL(10,2) NOT NULL,
    revenue_generated DECIMAL(10,2) NOT NULL,
    roas DECIMAL(5,2) NOT NULL
);

-- ==========================================
-- Blinkit Business Analytics
-- Marketing Performance Table
-- ==========================================

SELECT * 
FROM marketing_performance;

SELECT campaign_id,
       COUNT(*) AS duplicate_count
FROM marketing_performance
GROUP BY campaign_id
HAVING COUNT(*) > 1;

SELECT *
FROM marketing_performance
WHERE campaign_id IS NULL;

SELECT *
FROM marketing_performance
WHERE campaign_name IS NULL;

SELECT *
FROM marketing_performance
WHERE campaign_date IS NULL;

SELECT *
FROM marketing_performance
WHERE target_audience IS NULL;

SELECT *
FROM marketing_performance
WHERE channel IS NULL;

SELECT *
FROM marketing_performance
WHERE impressions IS NULL;

SELECT *
FROM marketing_performance
WHERE clicks IS NULL;

SELECT *
FROM marketing_performance
WHERE conversions IS NULL;

SELECT *
FROM marketing_performance
WHERE spend IS NULL;

SELECT *
FROM marketing_performance
WHERE revenue_generated IS NULL;

SELECT *
FROM marketing_performance
WHERE roas IS NULL;

SELECT *
FROM marketing_performance
WHERE impressions < 0
   OR clicks < 0
   OR conversions < 0
   OR spend < 0
   OR revenue_generated < 0
   OR roas < 0;
   
SELECT *
FROM marketing_performance
WHERE clicks > impressions;

SELECT *
FROM marketing_performance
WHERE conversions > clicks;

SELECT *
FROM marketing_performance
WHERE spend = 0
  AND revenue_generated > 0;
  
  SELECT
MIN(campaign_date) AS earliest_campaign,
MAX(campaign_date) AS latest_campaign
FROM marketing_performance;

SELECT channel,
       COUNT(*) AS total
FROM marketing_performance
GROUP BY channel
ORDER BY total DESC;

SELECT target_audience,
       COUNT(*) AS total
FROM marketing_performance
GROUP BY target_audience
ORDER BY total DESC;

SELECT campaign_name,
       COUNT(*) AS total
FROM marketing_performance
GROUP BY campaign_name
ORDER BY total DESC;

SELECT COUNT(*) AS total_campaign_records
FROM marketing_performance;