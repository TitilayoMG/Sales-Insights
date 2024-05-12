-- This dataset provides information related to sales orders. It includes details about orders, customers, products and sales transactions.

-- DATA PREPROCESSING
-- Counting the number of unique product names from the producttable.
SELECT COUNT(DISTINCT `PRODUCT NAME`) AS unique_product_count
FROM producttable

-- Counting the number of unique subcategories in the data
SELECT CATEGORY, COUNT(DISTINCT sub_category) 
FROM producttable
GROUP BY CATEGORY

-- Counting the number of distinct categories in the producttable.
SELECT COUNT(DISTINCT category) AS Category
FROM producttable;

-- EXPLORATORY DATA ANALYSIS
-- The product with the highest sales
SELECT CATEGORY, SUB_CATEGORY, `PRODUCT NAME`, sum(SALES) FROM producttable P
JOIN salestable S ON P.`ROW ID`=S.`ROW ID`
GROUP BY P.`PRODUCT NAME`
ORDER BY sum(SALES) DESC

-- The product with the highest sales
SELECT CATEGORY, SUB_CATEGORY, `PRODUCT NAME`, sum(PROFIT) FROM producttable P
JOIN salestable S ON P.`ROW ID`=S.`ROW ID`
GROUP BY P.`PRODUCT NAME`
ORDER BY sum(PROFIT) DESC

-- The product with the highest Sold Qty
SELECT CATEGORY, SUB_CATEGORY, `PRODUCT NAME`, sum(QUANTITY) FROM producttable P
JOIN salestable S ON P.`ROW ID`=S.`ROW ID`
GROUP BY P.`PRODUCT NAME`
ORDER BY sum(QUANTITY) DESC

-- Identifying the subcategory with the highest sales
SELECT CATEGORY, SUB_CATEGORY, SUM(SALES) AS TOTAL_SALES
FROM producttable P
JOIN salestable S ON P.`ROW ID`=S.`ROW ID`
GROUP BY SUB_CATEGORY
ORDER BY SUM(SALES) DESC

-- Identifying the subcategory with the highest profit 
SELECT CATEGORY, SUB_CATEGORY, SUM(PROFIT) AS TOTAL_PROFIT
FROM producttable P
JOIN salestable S ON P.`ROW ID`=S.`ROW ID`
GROUP BY SUB_CATEGORY
ORDER BY SUM(PROFIT) DESC

--Identifying the subcategory with the highest quantity sold
SELECT CATEGORY, SUB_CATEGORY, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM producttable P
JOIN salestable S ON P.`ROW ID`=S.`ROW ID`
GROUP BY SUB_CATEGORY
ORDER BY SUM(QUANTITY) DESC

-- Showing the category with the highest sales
SELECT category, SUM(SALES) AS TOTAL_SALES
FROM producttable P
JOIN salestable S ON P.`ROW ID`=S.`ROW ID`
GROUP BY category 
ORDER BY SUM(SALES) DESC


-- Showing the category with the highest profit
SELECT category, SUM(PROFIT) AS TOTAL_PROFIT
FROM producttable P
JOIN salestable S ON P.`ROW ID`=S.`ROW ID`
GROUP BY category 
ORDER BY SUM(PROFIT) DESC

-- Showing the category with the highest quantity sold
SELECT category, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM producttable P
JOIN salestable S ON P.`ROW ID`=S.`ROW ID`
GROUP BY category 
ORDER BY SUM(QUANTITY) DESC

-- Identifying the most preferred payment method by customers
 SELECT COUNT(`PAYMENT MODE`), `PAYMENT MODE` FROM salestable
 GROUP BY `PAYMENT MODE`
 ORDER BY COUNT(`PAYMENT MODE`) DESC
 
 -- Determining the city with the highest order count
SELECT COUNT(`ORDER ID`), CITY, STATE, REGION FROM ordertable
GROUP BY CITY
ORDER BY COUNT(`ORDER ID`) DESc

-- Determining the state with the highest order count
SELECT COUNT(`ORDER ID`), STATE, REGION FROM ordertable
GROUP BY STATE
ORDER BY COUNT(`ORDER ID`) DESC

-- Determining the region with the highest order count
SELECT COUNT(`ORDER ID`), REGION FROM ordertable
GROUP BY REGION
ORDER BY COUNT(`ORDER ID`) DESC

-- Determining the customer with the highest order count.
SELECT COUNT( `ORDER ID`), `CUSTOMER NAME`, `CUSTOMER ID` FROM customertable 
GROUP BY `CUSTOMER NAME`, `CUSTOMER ID`
ORDER BY COUNT( `ORDER ID`) DESC

-- Identifying the customer generating the highest profits
SELECT SUM( PROFIT),`CUSTOMER NAME`, `CUSTOMER ID` FROM customertable C
JOIN salestable S ON S.`ROW ID`=C.`ROW ID` 
GROUP BY `CUSTOMER NAME`, `CUSTOMER ID`
ORDER BY SUM( PROFIT) DESC

-- Identifying the customer generating the highest sales
SELECT SUM( SALES),`CUSTOMER NAME`, `CUSTOMER ID` FROM customertable C
JOIN salestable S ON S.`ROW ID`=C.`ROW ID` 
GROUP BY `CUSTOMER NAME`, `CUSTOMER ID`
ORDER BY SUM(SALES) DESC

-- Identifying the customer purchasing the highest quantity
SELECT SUM( QUANTITY), `CUSTOMER NAME`, `CUSTOMER ID` FROM customertable C
JOIN salestable S ON S.`ROW ID`=C.`ROW ID` 
GROUP BY `CUSTOMER NAME`, `CUSTOMER ID`
ORDER BY 1 DESC

-- Determining the city with the highest number of customers
SELECT COUNT( DISTINCT`CUSTOMER ID`), CITY, STATE, REGION FROM customertable C
JOIN ordertable O ON O.`ROW ID`=C.`ROW ID` 
GROUP BY CITY
ORDER BY COUNT( `CUSTOMER ID`) DESC

-- Determining the state with the highest number of customers
SELECT COUNT(DISTINCT `CUSTOMER ID`), STATE, REGION FROM customertable C
JOIN ordertable O ON O.`ROW ID`=C.`ROW ID` 
GROUP BY STATE
ORDER BY COUNT( `CUSTOMER ID`) DESC

-- Determining the region with the highest number of customers 
SELECT COUNT(DISTINCT `CUSTOMER ID`), REGION FROM customertable C
JOIN ordertable O ON O.`ROW ID`=C.`ROW ID` 
GROUP BY REGION
ORDER BY COUNT( `CUSTOMER ID`) DESC

-- Identifying the month with the highest overall sales
SELECT MONTH(`order date`) AS month, SUM(sales) AS total_sales
FROM salestable s
JOIN ordertable o ON s.`order id` = o.`order id`
GROUP BY MONTH(`order date`)
ORDER BY total_sales DESC

-- Identifying the month and year combination that generates the highest sales
SELECT YEAR(`order date`) AS year, MONTH(`order date`) AS month, SUM(sales) AS total_sales
FROM salestable s
JOIN ordertable o ON s.`order id` = o.`order id`
GROUP BY YEAR(`order date`), MONTH(`order date`)
ORDER BY total_sales desc

-- Identifying the month with the highest overall profit
SELECT MONTH(`order date`) AS month, SUM(Profit) AS total_profit
FROM salestable s
JOIN ordertable o ON s.`order id` = o.`order id`
GROUP BY MONTH(`order date`)
ORDER BY total_profit desc

-- Identifying the month and year combination that generates the highest profit
SELECT YEAR(`order date`) AS year, MONTH(`order date`) AS month, SUM(Profit) AS total_profit
FROM salestable s
JOIN ordertable o ON s.`order id` = o.`order id`
GROUP BY YEAR(`order date`),MONTH(`order date`)
ORDER BY total_profit desc

-- Identifying the day of the week with the highest overall profit
SELECT DAYNAME(`order date`) AS day_of_week, SUM(Profit) AS total_profit
FROM salestable s
JOIN ordertable o ON s.`order id` = o.`order id`
GROUP BY DAYNAME(`order date`)
ORDER BY total_profit desc

-- Identifying the day of the week with the highest overall sales
SELECT DAYNAME(`order date`) AS day_of_week, SUM(sales) AS total_sales
FROM salestable s
JOIN ordertable o ON s.`order id` = o.`order id`
GROUP BY DAYNAME(`order date`)
ORDER BY total_sales DESC

-- Identifying the products with the highest number of returns
SELECT `PRODUCT NAME`, SUB_CATEGORY, CATEGORY, SUM(RETURNS) 
FROM producttable P
JOIN salestable S ON S.`ROW ID`= P.`ROW ID`
GROUP BY `PRODUCT NAME`
ORDER BY SUM(RETURNS) DESC

-- Identifying the sub categories with the highest number of returns.
SELECT  SUB_CATEGORY, CATEGORY, SUM(RETURNS) 
FROM producttable P
JOIN salestable S ON S.`ROW ID`= P.`ROW ID`
GROUP BY  SUB_CATEGORY
ORDER BY SUM(RETURNS) DESC

-- Identifying the category with the highest number of returns
SELECT CATEGORY, SUM(RETURNS) 
FROM producttable P
JOIN salestable S ON S.`ROW ID`= P.`ROW ID`
GROUP BY CATEGORY
ORDER BY SUM(RETURNS) DESC

-- WHICH SEGMENT HAS THE HIGHEST NUMBER OF CUSTOMERS
SELECT SEGMENT, COUNT(`CUSTOMER NAME`)
FROM customertable
GROUP BY SEGMENT
ORDER BY COUNT(`CUSTOMER NAME`) DESC

SELECT * FROM customertable
SELECT * FROM ordertable
SELECT * FROM producttable
SELECT * FROM salestable
