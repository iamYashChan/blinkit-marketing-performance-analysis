-- ==========================================================
-- LEVEL 2 : MARKETING PERFORMANCE ANALYSIS
-- ==========================================================

-- ============================================================
-- Query 1 : Revenue by Campaign
-- Business Question:
-- Which marketing campaigns generated the highest revenue?
-- =============================================================

SELECT
    campaign_name,
    ROUND(SUM(revenue_generated), 2) AS total_revenue
FROM marketing_performance
GROUP BY campaign_name
ORDER BY total_revenue DESC;

-- ============================================================
-- Query 2 : Marketing Spend by Campaign
-- Business Question:
-- Which marketing campaigns had the highest spending?
-- =============================================================

SELECT
    campaign_name,
    ROUND(SUM(spend), 2) AS total_spend
FROM marketing_performance
GROUP BY campaign_name
ORDER BY total_spend DESC;

-- ============================================================
-- Query 3 : Profit by Campaign
-- Business Question:
-- Which campaigns generated the highest profit?
-- =============================================================

SELECT
    campaign_name,
    ROUND(SUM(revenue_generated) - SUM(spend), 2) AS total_profit
FROM marketing_performance
GROUP BY campaign_name
ORDER BY total_profit DESC;

-- ============================================================
-- Query 4 : ROAS by Campaign
-- Business Question:
-- Which campaigns delivered the highest Return on Ad Spend?
-- =============================================================

SELECT
    campaign_name,
    ROUND(SUM(revenue_generated) / SUM(spend), 2) AS roas
FROM marketing_performance
GROUP BY campaign_name
ORDER BY roas DESC;

-- ============================================================
-- Query 5 : Top 5 Campaigns by Revenue
-- Business Question:
-- Which are the top 5 revenue-generating campaigns?
-- =============================================================

SELECT
    campaign_name,
    ROUND(SUM(revenue_generated), 2) AS total_revenue
FROM marketing_performance
GROUP BY campaign_name
ORDER BY total_revenue DESC
LIMIT 5;

-- ============================================================
-- Query 6 : Bottom 5 Campaigns by Revenue
-- Business Question:
--  Which are the lowest revenue-generating campaigns?
-- =============================================================

SELECT
    campaign_name,
    ROUND(SUM(revenue_generated), 2) AS total_revenue
FROM marketing_performance
GROUP BY campaign_name
ORDER BY total_revenue ASC
LIMIT 5;

-- ============================================================
-- Query 7 : Revenue by Marketing Channel
-- Business Question:
-- Which marketing channel generated the highest revenue?
-- =============================================================

SELECT
    channel,
    ROUND(SUM(revenue_generated), 2) AS total_revenue
FROM marketing_performance
GROUP BY channel
ORDER BY total_revenue DESC;

-- ============================================================
-- Query 8 : ROAS  by Marketing Channel
-- Business Question:
-- Which marketing channel delivered the highest ROAS?
-- =============================================================

SELECT
    channel,
    ROUND(SUM(revenue_generated) / SUM(spend), 2) AS roas
FROM marketing_performance
GROUP BY channel
ORDER BY roas DESC;


-- ============================================================
-- Query 9 : Monthly Revenue Trend
-- Business Question:
-- How did revenue change month by month?
-- =============================================================
SELECT
    DATE_FORMAT(campaign_date, '%Y-%m') AS month,
    ROUND(SUM(revenue_generated), 2) AS total_revenue
FROM marketing_performance
GROUP BY month
ORDER BY month;

-- ============================================================
-- Query 10 : Monthly Marketing Spend Trend
-- Business Question:
-- How did marketing spend change month by month?
-- =============================================================

SELECT
    DATE_FORMAT(campaign_date, '%Y-%m') AS month,
    ROUND(SUM(spend), 2) AS total_spend
FROM marketing_performance
GROUP BY month
ORDER BY month;