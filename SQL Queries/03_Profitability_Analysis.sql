-- Overall Profitability
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore;

-- 2. Profit by Category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY category
ORDER BY total_profit DESC;

-- 3. Profit by Subcategory
SELECT
    subcategory,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY subcategory
ORDER BY total_profit DESC;

-- 4. Bottom 10 Subcategories
SELECT
    subcategory,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY subcategory
ORDER BY total_profit
LIMIT 10;

-- 5. Profit by Region
SELECT
    region,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;

-- 6. Top 10 Most Profitable Products
SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- 7. Top 10 Loss-Making Products
SELECT
    product_name,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit
LIMIT 10;

-- 8. Profitability by Segment
SELECT
    segment,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY segment
ORDER BY total_profit DESC;

-- 9. Discount Impact on Profit
SELECT
    discount,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY discount
ORDER BY discount;

-- 10. Discount-Level Profit Analysis
SELECT
    discount,
    COUNT(*) AS transactions,
    ROUND(SUM(profit),2) AS total_profit
FROM superstore
WHERE discount > 0
GROUP BY discount
ORDER BY discount;

-- 11. Highest Margin Products
SELECT
    product_name,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY product_name
ORDER BY profit_margin_pct DESC
LIMIT 10;

-- 12. Lowest Margin Products
SELECT
    product_name,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY product_name
ORDER BY profit_margin_pct
LIMIT 10;

/*
PROFITABILITY ANALYSIS SUMMARY

- The business generated total profit of $286,409.08 from $2,296,919.49
  in sales, resulting in an overall profit margin of 12.47%.

- Technology was the most profitable category, generating $145,454.95
  in profit with a 17.40% profit margin.

- Furniture showed significantly weaker profitability despite substantial
  sales, generating only $18,463.33 in profit with a 2.49% margin.

- Copiers were the most profitable subcategory, while Tables generated
  the largest subcategory-level loss.

- The West region generated the highest profit ($108,418.45) and the
  highest regional profit margin (14.94%).

- The Consumer segment generated the highest total profit, while the
  Home Office segment recorded the highest profit margin.

- Several individual products generated substantial losses. The Cubify
  CubeX 3D Printer Double Head generated the largest product-level loss.

- Aggregate profit remained positive at discount levels up to 20% but
  became negative at 30% and at all higher discount levels shown in
  the dataset.

These findings demonstrate that strong sales do not necessarily translate
into strong profitability. Category, product, regional, and discount-level
performance should therefore be considered alongside overall sales when
making business decisions.
*/
