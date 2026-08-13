-- 1. Regional Sales Performance
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- 2. Regional Profitability
SELECT
    region,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- 3. Regional Profit Margin
SELECT
    region,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM superstore
GROUP BY region
ORDER BY profit_margin DESC;

-- 4. Regional Sales and Profit Comparison
SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- 5. Top 10 States by Sales
SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

-- 6. Bottom 10 States by Sales
SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales
LIMIT 10;

-- 7. Top 10 States by Profit
SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

-- 8. Bottom 10 States by Profit
SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_profit
LIMIT 10;

-- 9. Top 10 Cities by Sales
SELECT
    city,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;

-- 10. Top 10 Cities by Profit
SELECT
    city,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY city
ORDER BY total_profit DESC
LIMIT 10;

-- 11. Loss-Making Cities
SELECT
    city,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY city
HAVING SUM(profit) < 0
ORDER BY total_profit;

-- 12. State-Level Profit Margin Analysis
SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin
FROM superstore
GROUP BY state
ORDER BY profit_margin DESC;

/*
REGIONAL ANALYSIS SUMMARY

- The West region generated the highest sales revenue at $725,457.82.
- The West region achieved the highest total profit at $108,418.45.
- The West region recorded the strongest regional profit margin at 14.94%.
- California was the top-performing state by sales.
- California generated the highest total profit among all states at $76,381.39.
- District of Columbia recorded the highest state-level profit margin at 36.98%.
- Several states generated substantial sales but delivered relatively weak profitability.
- New York City emerged as the strongest revenue-generating market.
- Multiple cities recorded negative profits, indicating potential pricing, discounting, or operational challenges.

These findings highlight geographic performance differences and help identify regions, states,
and cities requiring strategic attention, investment, or profitability improvement initiatives.
*/
