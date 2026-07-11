-- CREATING A NEW DATABASE:-

CREATE DATABASE IF NOT EXISTS Amazon_ecommerce_Sales_Data_Analysis;

-- USING THE DATABASE:-

USE Amazon_ecommerce_Sales_Data_Analysis;

-- CREATING A TABLE FOR THE IMPORTED DATA:-

CREATE TABLE amazon_sale_report(
`index` INT PRIMARY KEY,
order_ID VARCHAR(255) NOT NULL,
date DATE,
status VARCHAR(255),
fulfilment VARCHAR(255),
sales_channel VARCHAR(255),
ship_service_level VARCHAR(255),
style VARCHAR(255),
SKU VARCHAR(255),
category VARCHAR(255),
size VARCHAR(255),
asin VARCHAR(255),
courier_status VARCHAR(255),
quantity INT,
currency VARCHAR(255),
amount DOUBLE,
ship_city VARCHAR(255),
ship_state VARCHAR(255),
ship_postal_code INT,
ship_country VARCHAR(255),
b2b VARCHAR(255),
fulfilled_by VARCHAR(255),
promotions VARCHAR(255),
day VARCHAR(255),
month VARCHAR(255),
year VARCHAR(255)
);

-- TO ALLOW THE UPLOAD OF DATA FILES DIRECTLY FROM COMPUTER'S LOCAL HARD DRIVE:-

SET GLOBAL local_infile = 1;

-- TO CHECK IN WHICH SPECIFIC FOLDER ON COMPUTER IS LEGALLY ALLOWED TO IMPORT OR EXPORT FILES:-

SHOW VARIABLES LIKE "secure_file_priv";

-- TO IMPORT CSV FILE INTO ASSIGNED TABLE:-

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Amazon E-commerce Sales Data Analysis - For SQL.csv' 
INTO TABLE amazon_sale_report
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


-- PRINTING THE THE TABLE:-

SELECT * FROM amazon_sale_report;


-- FINDING TOP 10 CATEGORY WHICH GENEARTED MOST REVENUE AND HOW MUCH QUANTITY WAS SOLD:-

SELECT category, SUM(quantity) AS Total_Quantity, ROUND(SUM(amount),2) AS Total_Revenue FROM amazon_sale_report GROUP BY category ORDER BY Total_Revenue DESC LIMIT 10;

-- FINDING WHAT PERCENTAGE OF REVENUE DOES EACH PRODUCT CATEGORY CONTRIBUTE:-

SELECT category, ROUND(SUM(amount),2) AS Total_Revenue, ROUND((SUM(amount) / SUM(SUM(amount)) OVER ()) * 100,2) AS Percentage_Contribution FROM amazon_sale_report
GROUP BY category ORDER BY Percentage_Contribution DESC;  -- CATEGORY WISE CONTRIBUTION TOWARDS REVENUE

-- FINDING TOTAL REVENUE OVER A SPECIFIC PERIOD:-

SELECT date, COUNT(order_ID) AS Total_Orders FROM amazon_sale_report WHERE date BETWEEN '2022-03-31' AND '2022-06-29' GROUP BY date;  -- DAY WISE

SELECT month, COUNT(order_ID) AS Total_Orders FROM amazon_sale_report WHERE month IN ('March','April','May','June') GROUP BY month;  -- MONTH WISE

SELECT day, COUNT(order_ID) AS Total_Orders FROM amazon_sale_report WHERE day IN ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') GROUP BY day; --  ACTUAL WEEKDAY WISE

SELECT year, COUNT(order_ID) AS Total_Order FROM amazon_sale_report WHERE year IN ('2022'); -- YEAR WISE

-- FINDING AVERAGE ORDER VALUE (AOV):-

SELECT ROUND(SUM(amount)/COUNT(DISTINCT order_ID),2) AS Avg_Order_Value FROM amazon_sale_report;

SELECT category, ROUND(SUM(amount)/COUNT(order_ID),2) AS Avg_Order_Value FROM amazon_sale_report GROUP BY category ORDER BY Avg_Order_Value DESC;

-- FINDING SALES PERFORMANCE ACROSS DIFFERENT GEOGRAPHICAL REGIONS:-

SELECT ship_state  AS State, ROUND(SUM(amount),2) AS Total_Revenue FROM amazon_sale_report GROUP BY State ORDER BY Total_Revenue DESC; -- STATE WISE REVENUE

SELECT ship_city AS City, ROUND(SUM(amount),2) AS Total_Revenue FROM amazon_sale_report GROUP BY City ORDER BY Total_Revenue DESC; -- CITY WISE REVENUE

SELECT ship_postal_code AS Postal_Code, ROUND(SUM(amount),2) AS Total_Revenue FROM amazon_sale_report GROUP BY Postal_Code ORDER BY Total_Revenue DESC; -- POST CODE WISE REVENUE

-- FINDING MONTH-OVER-MONTH SALES GROWTH RATE:-

SELECT DATE_FORMAT(date,'%M %Y') AS Month_Year, ROUND(SUM(amount),2) AS Total_Revenue FROM amazon_sale_report 
GROUP BY YEAR(date), MONTH(date) ORDER BY YEAR(date), MONTH(date) ASC; -- MONTH-OVER-MONTH TOTAL SALES

-- FINDING HOW EFFECTIVE ARE PROMOTIONAL DISCOUNTS:-

SELECT promotions, category, COUNT(DISTINCT order_ID) AS Total_Orders, SUM(quantity) AS Total_Units_Sold, Round(SUM(amount),2) AS Total_Revenue 
FROM amazon_sale_report GROUP BY promotions, category ORDER BY promotions DESC;

-- FINDING OUT ORDER CANCELLATION RATE AND RETURN RATE:-

SELECT courier_status, COUNT(courier_status) AS Count_Of_Courier_Status, ROUND((COUNT(courier_status)/SUM(COUNT(courier_status)) OVER ()) * 100,2) AS Percentage_Contribution
FROM amazon_sale_report GROUP BY courier_status ORDER BY Percentage_Contribution DESC;

SELECT fulfilled_by, courier_status, COUNT(courier_status) AS Count_Of_Courier_Status, ROUND((COUNT(courier_status)/SUM(COUNT(courier_status)) OVER ()) *100,2) AS Percentage_Contribution
FROM amazon_sale_report GROUP BY fulfilled_by, courier_status ORDER BY fulfilled_by, Percentage_Contribution DESC; -- MERCHANT WISE 

SELECT fulfilled_by, status , COUNT(status) AS Count_Of_Status, ROUND((COUNT(status)/SUM(COUNT(status)) OVER ()) *100,2) AS Percentage_Contribution
FROM amazon_sale_report GROUP BY fulfilled_by, status ORDER BY fulfilled_by, Percentage_Contribution DESC; -- ANOTHER STATUS COLUMN SHOWING ACTUAL GRANULARITY OF ORDER STATUS

-- FINDING AVERAGE NUMBER OF ITEMS PER ORDER (UNITS PER TRANSACTION):-

SELECT SUM(quantity)/COUNT(DISTINCT order_ID) AS Units_Per_Transaction FROM amazon_sale_report;

SELECT category, SUM(quantity)/COUNT(DISTINCT order_ID) AS Units_Per_Transaction FROM amazon_sale_report GROUP BY category ORDER BY Units_Per_Transaction DESC;

-- FINDING HOW MANY ORDERS WHERE B2B AND DIFFERENCE IN REVENUE:-

SELECT b2b, COUNT(DISTINCT order_ID) AS Total_Order, ROUND(SUM(amount),2) AS Total_Revenue FROM amazon_sale_report GROUP BY b2b ORDER BY Total_Revenue DESC;

