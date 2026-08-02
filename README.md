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

## 📁 Project Files

`01_Data_Exploration.sql` — Data discovery, validation, cleaning, and quality checks.

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
## 👤 Author

**Chitranjali O.K.**
