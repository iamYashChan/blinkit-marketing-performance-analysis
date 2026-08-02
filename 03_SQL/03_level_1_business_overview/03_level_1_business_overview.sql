-- ==========================================================
-- LEVEL 1 : BUSINESS OVERVIEW
-- ==========================================================

-- ============================================================
-- Query 1 : Total Marketing Spend
-- Business Question:
-- How much money did the company spend on marketing campaigns?
-- =============================================================

SELECT
    ROUND(SUM(spend), 2) AS total_marketing_spend
FROM marketing_performance;

-- ============================================================
-- Query 2 : Total Revenue Generated
-- Business Question:
-- How much revenue did marketing generate?
-- =============================================================

SELECT
    ROUND(SUM(revenue_generated), 2) AS total_revenue
FROM marketing_performance;

-- ============================================================
-- Query 3 : Overall Profit
-- Business Question:
-- How much profit did our marketing campaigns generate?
-- =============================================================

SELECT
    ROUND(SUM(revenue_generated) - SUM(spend), 2) AS total_profit
FROM marketing_performance;

-- ============================================================
-- Query 4 : Overall ROAS (Return on Ad Spend)
-- Business Question:
-- For every ₹1 spent, how much revenue did we earn?
-- =============================================================

SELECT
    ROUND(SUM(revenue_generated) / SUM(spend), 2) AS overall_roas
FROM marketing_performance;

-- ============================================================
-- Query 5 : Total Impressions
-- Business Question:
-- How many people saw our advertisements?
-- =============================================================

SELECT
    SUM(impressions) AS total_impressions
FROM marketing_performance;

-- ============================================================
-- Query 6 : Total Clicks
-- Business Question:
-- How many users clicked on our ads?
-- =============================================================

SELECT
    SUM(clicks) AS total_clicks
FROM marketing_performance;

-- ============================================================
-- Query 6 : Overall CTR (Click Through Rate)
-- Business Question:
-- What percentage of people who saw the ad actually clicked it?
-- =============================================================

SELECT
    ROUND(
        (SUM(clicks) * 100.0) / SUM(impressions),
        2
    ) AS overall_ctr_percentage
FROM marketing_performance;

-- ============================================================
-- Query 6 : Overall Conversion Rate
-- Business Question:
-- Out of all users who clicked, how many converted?
-- =============================================================\

SELECT
    ROUND(
        (SUM(conversions) * 100.0) / SUM(clicks),
        2
    ) AS conversion_rate_percentage
FROM marketing_performance;