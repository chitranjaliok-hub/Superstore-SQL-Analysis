-- 1. Total Sales
SELECT
    ROUND(SUM(sales),2) AS total_sales
FROM superstore;

-- 2. Sales by Category
SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- 3. Sales by Subcategory
SELECT
    subcategory,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY subcategory
ORDER BY total_sales DESC;

-- 4. Sales by Region
SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- 5. Sales by State
SELECT
    state,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

-- 6. Monthly Sales Trend
SELECT
    DATE_FORMAT(order_date,'%Y-%m') AS month,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;

-- 7. Yearly Sales Trend
SELECT
    YEAR(order_date) AS year,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY year
ORDER BY year;

-- 8. Sales by Segment
SELECT
    segment,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

-- 9. Top 10 Revenue-Generating Products
SELECT
    product_name,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- 10. Average Order Value (AOV)
SELECT
    ROUND(
        SUM(sales) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM superstore;


/*
SALES PERFORMANCE ANALYSIS SUMMARY

- Total sales generated during the analysis period were $2296919.49.
- Technology category contributed the highest share of revenue, while Office Supplies category generated the lowest sales.
- Phones emerged as the top revenue-generating product group.
- West region recorded the highest sales performance, indicating strong market demand.
- California was the leading contributor to overall revenue.
- Consumer segment accounted for the largest portion of sales among customer segments.
- Annual sales declined slightly in 2020 before showing strong growth in 2021 and 2022, with 2022 recording the highest sales.
- ‘Canon imageCLASS 2200 Advanced Copier’ generated the highest revenue among all products.
- The average order value was $458.56 per order.

These findings highlight the primary revenue drivers of the business and identify the products, customer segments, and geographic regions contributing most to sales performance.
*/
