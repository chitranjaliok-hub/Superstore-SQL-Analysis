# Global Superstore SQL Analysis

## 📌 Project Overview

This project analyzes the Global Superstore dataset using MySQL to uncover business insights related to sales, profitability, customers, and regional performance.

The analysis is being developed in multiple stages, covering data exploration, sales performance, profitability, customer behavior, regional performance, and business recommendations.

## 🛠️ Tools & Technologies

- MySQL
- MySQL Workbench
- SQL

## 🔍 Analysis

### 1. Data Exploration

The dataset was explored and validated before performing business analysis.

Key steps included:

- Examining dataset structure and record count
- Validating data types
- Checking and converting date fields
- Checking for missing values
- Identifying and removing duplicate records
- Validating sales and quantity values

### 📊 Data Exploration Summary

- Original records: **9,994**
- Duplicate transactions identified: **1**
- Records after cleaning: **9,993**
- Date fields successfully converted to `DATE`
- No critical null values detected
- No invalid sales or quantity values detected

The cleaned dataset is suitable for further business analysis.

### 2. Sales Performance Analysis

Sales performance was analyzed across product categories, geographic regions, customer segments, and time periods to identify the primary drivers of business sales.

Key analyses included:

- Total sales
- Sales by category and sub-category
- Sales by region and state
- Monthly and yearly sales trends
- Sales by customer segment
- Top revenue-generating products
- Average Order Value (AOV)

### 📊 Sales Performance Summary

- Total sales: **$2,296,919.49**
- **Technology** generated the highest category-level sales at **$836,154.03**
- **Office Supplies** recorded the lowest category-level sales at **$719,047.03**
- **Phones** were the highest-selling sub-category
- The **West** region recorded the highest sales
- **California** was the leading state by sales
- The **Consumer** segment contributed the highest sales
- Annual sales declined slightly in 2020 before growing strongly in 2021 and 2022
- **2022** recorded the highest annual sales at **$733,215.26**
- **Canon imageCLASS 2200 Advanced Copier** was the highest revenue-generating product
- Average Order Value (AOV): **$458.56**

The analysis highlights the products, customer segments, geographic markets, and time periods that contribute most strongly to overall sales performance.

### 3. Profitability Analysis

Profitability was analyzed across categories, subcategories, products, regions, customer segments, and discount levels to identify the strongest and weakest areas of business performance.

Key analyses included:

- Overall profit and profit margin
- Profitability by category and subcategory
- Regional profitability
- Customer segment profitability
- Most profitable products
- Loss-making products
- Impact of discounts on profit
- Product-level profit margins

### 📊 Profitability Summary

- Total profit: **$286,409.08**
- Overall profit margin: **12.47%**
- **Technology** was the most profitable category with **$145,454.95** in profit and a **17.40%** margin
- **Furniture** generated substantial sales but achieved only a **2.49%** profit margin
- **Copiers** were the most profitable subcategory, generating **$55,617.82** in profit
- **Tables** were the largest loss-making subcategory at **-$17,725.48**
- The **West** was the most profitable region with **$108,418.45** in profit and a **14.94%** margin
- The **Consumer** segment generated the highest total profit, while **Home Office** achieved the highest profit margin
- **Canon imageCLASS 2200 Advanced Copier** was the most profitable individual product
- Aggregate profit became negative at discount levels of **30% and above** in the analyzed data

The analysis shows that high sales alone do not guarantee strong profitability. Product mix, regional performance, and discount strategy all have a significant impact on overall business profitability.

### 4. Customer Analysis

Customer-level analysis was performed to understand the customer base, identify high-value customers, evaluate purchasing behavior, and compare customer segments.

Key analyses included:

- Total customer base
- Top 10 customers by sales
- Top 10 customers by profit
- Bottom 10 customers by profit
- Average revenue per customer
- Customer order frequency
- Customer segment performance
- Average Order Value (AOV) by customer segment
- Customer profitability distribution

### 📊 Customer Analysis Summary

- The business served **793 unique customers**
- **Sean Miller** generated the highest total sales
- **Tamara Chand** generated the highest profit contribution
- Several customers generated negative profitability despite making purchases
- The **Consumer** segment represented the largest customer group and contributed the highest total sales
- Average Order Value was analyzed across customer segments to identify differences in purchasing behavior
- Customer-level profitability analysis helped identify both high-value and loss-making customers

The analysis helps identify high-value customers, profitability differences, customer purchasing patterns, and opportunities for improving customer retention and profitability.

## 👤 Author

**Chitranjali O.K.**
