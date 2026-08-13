-- 1. Total Customer Base
SELECT
    COUNT(DISTINCT customer) AS total_customers
FROM superstore;

-- 2. Top 10 Customers by Sales
SELECT
    customer,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY customer
ORDER BY total_sales DESC
LIMIT 10;

-- 3. Top 10 Customers by Profit
SELECT
    customer,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY customer
ORDER BY total_profit DESC
LIMIT 10;

-- 4. Bottom 10 Customers by Profit
SELECT
    customer,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY customer
ORDER BY total_profit
LIMIT 10;

-- 5. Average Revenue per Customer
SELECT
    ROUND(
        SUM(sales) /
        COUNT(DISTINCT customer),
        2
    ) AS avg_revenue_per_customer
FROM superstore;

-- 6. Customer Order Frequency
SELECT
    customer,
    COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY customer
ORDER BY total_orders DESC
LIMIT 10;

-- 7. Customer Segment Performance
SELECT
    segment,
    COUNT(DISTINCT customer) AS customers,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

-- 8. Average Order Value by Segment
SELECT
    segment,
    ROUND(
        SUM(sales) /
        COUNT(DISTINCT order_id),
        2
    ) AS avg_order_value
FROM superstore
GROUP BY segment;

-- 9. -- 9. Customer Profitability
SELECT
    customer,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY customer
ORDER BY total_profit DESC;

/*
CUSTOMER ANALYSIS SUMMARY

- The business served 793 unique customers.
- Sean Miller generated the highest total sales.
- Tamara Chand generated the highest profit contribution.
- Several customers generated negative profitability despite making purchases.
- The Consumer segment represented the largest customer group and contributed the highest total sales.
- Average Order Value was analyzed across customer segments to compare purchasing behavior.
- Customer-level profitability analysis helped identify both high-value and loss-making customers.

These findings help identify high-value customers, customer profitability patterns,
and opportunities to improve customer retention and profitability.
*/
