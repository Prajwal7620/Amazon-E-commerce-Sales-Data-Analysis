# Amazon-E-commerce-Sales-Data-Analysis

## 📊 Project Description

This project delivers an end-to-end exploratory and diagnostic data analysis of the **`Amazon Sale Report.csv`** dataset (data source:- https://www.kaggle.com/datasets/thedevastator/unlock-profits-with-e-commerce-sales-data). The goal is to transform raw, messy transactional data into actionable e-commerce business intelligence. 

By deep-diving into historical sales, inventory movement, marketing success, and regional logistics, this analysis provides data-driven strategies to maximize revenue, optimize supply chains, and cut down on order churn.

## TOOLS USED:-

### 🐍 Python: Data Cleaning & Exploratory Data Analysis (EDA)
* **Data Preprocessing**: Handled missing values, removed duplicate entries, and treated statistical outliers using `Pandas` and `NumPy`.
* **Feature Engineering**: Standardized text fields, structured date formats, and extracted time-based elements (e.g., month, weekday) to analyze sales seasonality.
* **Visual Exploration**: Constructed distribution plots, correlation heatmaps, and sales curves using `Matplotlib` and `Seaborn` to isolate initial operational patterns.

### 🛢️ SQL: Targeted Business Querying
* **Performance Metrics**: Designed structured queries using `GROUP BY`, aggregation functions, and subqueries to compute monthly revenue growth, total volume, and average order values.
* **Strategic Categorization**: Segmented products by sales volume and cancellation percentages to pinpoint top revenue-generating inventory and product health risks.
* **Geographical Analysis**: Tracked and ranked order trends across different states and cities to highlight high-performing delivery hubs.

### 📊 Power BI: Interactive Dashboarding
* **Data Modeling**: Established clean table relationships and optimized metrics using **DAX** for seamless, fast-loading calculation of key KPIs.
* **Executive View**: Built dynamic dashboard views displaying high-level metrics like total profit margins, order fulfillment rates, and revenue distributions.
* **Granular Drilling**: Configured dynamic slicers allowing decision-makers to filter results by region, order status, or product line instantly.


### 🔍 Key Areas of Analysis

* **Temporal Sales Trends**: Dissecting overall revenue, daily/monthly order volumes, and average transaction values to map seasonal demand peaks.
* **Product Hierarchy & Performance**: Ranking **Categories** and **Sub-categories** to isolate top-tier revenue drivers from low-velocity merchandise.
* **Stock Keeping Unit (SKU) Dynamics**: Profiling SKU-level distribution to evaluate inventory health, identify high-turnover items, and catch overstocked inventory.
* **Promotional Campaign Efficacy**: Assessing the impact of **Promotions** and discounts on order sizes, conversion rates, and gross margins.
* **Geographical Distribution**: Mapping sales concentration to identify the specific **States and Cities** driving the highest consumer demand and revenue.
* **Logistics & Delivery Status**: Investigating order fulfillment by tracking the distribution and financial impact of **Shipped, Unshipped, and Cancelled orders**.

### 🛠️ Key Business Questions Answered
1. Which specific months or seasonal events experience the highest revenue surges?
2. What are the top 5 product categories and sub-categories driving the bulk of sales?
3. Did promotional discounts genuinely boost order volume, or did they simply dilute profit margins?
4. Which geographical hubs represent your most profitable markets for targeted warehousing and local advertising?
5. What percentage of total revenue is lost to cancellations, and are there specific regions or products tied to high cancellation rates?
