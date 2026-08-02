-- ==========================================================
-- LEVEL 3 : AUDIENCE ANALYSIS
-- ==========================================================

-- ============================================================
-- Query 1 : Revenue by The Target Audience
-- Business Question:
-- Which target audience generated the highest revenue?
-- =============================================================

SELECT
    target_audience,
    ROUND(SUM(revenue_generated),2) AS total_revenue
FROM marketing_performance
GROUP BY target_audience
ORDER BY total_revenue DESC;

-- ============================================================
-- Query 2 : Marketing Spend by Target Audience
-- Business Question:
-- Which target audience received the highest marketing investment?
-- =============================================================

SELECT
    target_audience,
    ROUND(SUM(spend),2) AS total_spend
FROM marketing_performance
GROUP BY target_audience
ORDER BY total_spend DESC;

-- ==========================================================
-- Query 3 : Profit by Target Audience
-- Business Question:
-- Which target audience generated the highest profit?
-- ==========================================================

SELECT
    target_audience,
    ROUND(SUM(revenue_generated)-SUM(spend),2) AS total_profit
FROM marketing_performance
GROUP BY target_audience
ORDER BY total_profit DESC;

-- ==========================================================
-- Query 4 : ROAS by Target Audience
-- Business Question:
-- Which target audience delivered the highest ROAS?
-- ==========================================================

SELECT
    target_audience,
    ROUND(SUM(revenue_generated)/SUM(spend),2) AS roas
FROM marketing_performance
GROUP BY target_audience
ORDER BY roas DESC;

-- ==========================================================
-- Query 5 : Conversion Rate by Target Audience
-- Business Question:
-- Which target audience achieved the highest conversion rate?
-- ==========================================================

SELECT
    target_audience,
    ROUND((SUM(conversions)*100.0)/SUM(clicks),2) AS conversion_rate
FROM marketing_performance
GROUP BY target_audience
ORDER BY conversion_rate DESC;

-- ==========================================================
-- Query 6 : CTR by Target Audience
-- Business Question:
-- Which target audience had the highest Click Through Rate?
-- ==========================================================

SELECT
    target_audience,
    ROUND((SUM(clicks)*100.0)/SUM(impressions),2) AS ctr
FROM marketing_performance
GROUP BY target_audience
ORDER BY ctr DESC;

-- ==========================================================
-- Query 7 : Campaign Count by Target Audience
-- Business Question:
-- How many marketing campaigns targeted each audience segment?
-- ==========================================================

SELECT
    target_audience,
    COUNT(*) AS total_campaigns
FROM marketing_performance
GROUP BY target_audience
ORDER BY total_campaigns DESC;