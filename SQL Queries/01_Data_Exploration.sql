-- =======================================================================
-- FILE: 01_Data_Exploration.sql
-- PURPOSE: High-level data discovery, schema validation, and null checks
-- =======================================================================

-- 1. Check the total row count to confirm data volume
SELECT COUNT(*) AS total_transactions FROM superstore;

-- 2. Inspect the first 10 rows to understand structural design and values
SELECT * FROM superstore LIMIT 10;

-- 3. Checking data types
/*
Historical Data Preparation Note:

During initial data ingestion, Order Date and Ship Date
were imported as TEXT fields and subsequently converted
to DATE format for temporal analysis.
*/
DESCRIBE superstore; 

-- 4. Date Format Check 
SELECT order_date, ship_date
FROM superstore
LIMIT 10;

-- 5. Date Conversion
/*
Run this section only once immediately after importing the CSV.
*/
SET SQL_SAFE_UPDATES = 0;

UPDATE superstore
SET order_date = STR_TO_DATE(order_date, '%m/%d/%Y'),
    ship_date = STR_TO_DATE(ship_date, '%m/%d/%Y');

ALTER TABLE superstore
MODIFY COLUMN order_date DATE;

ALTER TABLE superstore
MODIFY COLUMN ship_date DATE;

SET SQL_SAFE_UPDATES = 1;

SELECT `order_date`, `ship_date` 
FROM superstore 
LIMIT 5;

-- 6. Timeline Coverage
SELECT
    MIN(order_date) AS earliest_order,
    MAX(order_date) AS latest_order
FROM superstore;

-- 7. Null value check
SELECT
    SUM(CASE WHEN order_id IS NULL OR order_id = '' THEN 1 ELSE 0 END) AS null_orders,
    SUM(CASE WHEN customer IS NULL OR customer = '' THEN 1 ELSE 0 END) AS null_customers,
    SUM(CASE WHEN product_name IS NULL OR product_name = '' THEN 1 ELSE 0 END) AS null_products,
	SUM(CASE WHEN sales IS NULL OR sales = '' THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN profit IS NULL OR profit = '' THEN 1 ELSE 0 END) AS null_profit
FROM superstore;

-- 8. Unique Entities
SELECT
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer) AS unique_customers,
    COUNT(DISTINCT product_name) AS unique_products
FROM superstore;

-- 9. Multi-Order Items
SELECT
    order_id,
    COUNT(*) AS order_count
FROM superstore
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY order_count DESC;

-- 10. Category Distribution
SELECT
    category,
    COUNT(*) AS records,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM superstore),2) AS percentage
FROM superstore
GROUP BY category
ORDER BY records DESC;

-- 11. Segment Distribution
SELECT
    segment,
    COUNT(*) AS records,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM superstore),2) AS percentage
FROM superstore
GROUP BY segment;

-- 12. Region Distribution
SELECT
    region,
    COUNT(*) AS records,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM superstore),2) AS percentage
FROM superstore
GROUP BY region;

-- 13. Manufactory Distribution
SELECT
    manufactory,
    COUNT(*) AS records
FROM superstore
GROUP BY manufactory
ORDER BY records DESC
LIMIT 20;

-- 14. Numeric Data Health Check
SELECT
    ROUND(MIN(sales), 2) AS min_sales,
    ROUND(MAX(sales), 2) AS max_sales,
    ROUND(AVG(sales), 2) AS avg_sales,

    ROUND(MIN(profit), 2) AS min_profit,
    ROUND(MAX(profit), 2) AS max_profit,
    ROUND(AVG(profit), 2) AS avg_profit,

    ROUND(MIN(discount), 2) AS min_discount,
    ROUND(MAX(discount), 2) AS max_discount,
    ROUND(AVG(discount), 2) AS avg_discount,

    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity,

    ROUND(MIN(profit_margin),2) AS min_margin,
    ROUND(MAX(profit_margin),2) AS max_margin
FROM superstore;

-- 15. Invalid Business Value
SELECT
    SUM(CASE WHEN sales <= 0 THEN 1 ELSE 0 END) AS invalid_sales,
    SUM(CASE WHEN quantity <= 0 THEN 1 ELSE 0 END) AS invalid_quantity,
    SUM(CASE WHEN profit_margin IS NULL THEN 1 ELSE 0 END) AS invalid_margin
FROM superstore;

-- 16. Duplicate Check
SELECT
    order_id,
    customer,
    product_name,
    sales,
    quantity,
    COUNT(*) AS duplicate_count
FROM superstore
GROUP BY
    order_id,
    customer,
    product_name,
    sales,
    quantity
HAVING COUNT(*) > 1;

-- Step 1: Validate The Duplicate First
-- See both rows in full detail
SELECT *
FROM superstore
WHERE order_id = 'US-2020-150119'
  AND customer = 'Laurel Beltran'
  AND product_name LIKE 'Global Leather Highback%'
  AND sales = 281.3720
  AND quantity = 2;

-- Step 2: Deleting The Duplicate
SET SQL_SAFE_UPDATES = 0;

DELETE FROM superstore
WHERE order_id = 'US-2020-150119'
  AND customer = 'Laurel Beltran'
  AND product_name LIKE 'Global Leather Highback%'
  AND sales = 281.3720
  AND quantity = 2
LIMIT 1;

SET SQL_SAFE_UPDATES = 1;

-- Step 3: Verification
-- Should return exactly 1 row
SELECT * FROM superstore
WHERE order_id = 'US-2020-150119'
  AND customer = 'Laurel Beltran'
  AND product_name LIKE 'Global Leather Highback%';


/*
DATA EXPLORATION SUMMARY

- Dataset contains 9,994 records.
- One confirmed duplicate transaction was identified and removed.
- Final dataset contains 9,993 records.
- Date fields successfully converted to DATE datatype.
- No critical null values detected.
- No invalid sales or quantity values detected.
- Dataset is suitable for business analysis.
*/
