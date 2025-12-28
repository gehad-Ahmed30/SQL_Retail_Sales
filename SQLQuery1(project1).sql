-- SQL retail sales Analysis
CREATE DATABASE SQL_Analysis_project1;

-- Use Database
USE SQL_Analysis_project1;

-- Create Table
-- YYYY-MM-DD  ---> Date
-- HH:MM:SS  ---> Time
-- DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales (
  transication_id INT PRIMARY KEY,
  sale_date Date,
  sale_time TIME,
  customer_id INT,
  gender VARCHAR(15),
  age INT,
  category VARCHAR(15),
  quantity INT,
  price_per_unit FLOAT,
  cogs FLOAT,
  total_sales FLOAT,
)

SELECT * FROM retail_sales;

SELECT * FROM retails_sales;

SELECT TOP 10 * FROM retails_sales;

SELECT COUNT(*) FROM retails_sales;

-- Data Cleaning
SELECT * FROM dbo.retails_sales
WHERE transactions_id is NULL;

SELECT * FROM dbo.retails_sales
WHERE 
   transactions_id is NULL
   OR 
   sale_date is null 
   or
   sale_time is null 
   or
   customer_id is null
   or
   gender is null
   or 
   category is null
   or
   quantiy is null
   or 
   price_per_unit is null
   or
   cogs is null
   or 
   total_sale is null;

DELETE FROM retails_sales
WHERE 
   transactions_id is NULL
   OR 
   sale_date is null 
   or
   sale_time is null 
   or
   customer_id is null
   or
   gender is null
   or 
   category is null
   or
   quantiy is null
   or 
   price_per_unit is null
   or
   cogs is null
   or 
   total_sale is null;


-- Data Exploaration

-- How many sales we have?
SELECT COUNT(*) AS Total_sale
FROM retails_sales;

-- How many unique customer we have ?
SELECT COUNT(DISTINCT customer_id ) AS Total_customer FROM retails_sales;

-- How many unique category we have ?
SELECT COUNT(DISTINCT category ) as total_category FROM retails_sales;

SELECT DISTINCT category FROM retails_sales;

-- Data Analysis & Business Key Problems & Answers

-- write a sql query to retrives all column for sales made on "2022-11-05"
SELECT * 
FROM retails_sales
WHERE sale_date='2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT * 
FROM retails_sales
WHERE category='Clothing' 
AND quantiy >= 4 
AND sale_date>='2022-11-1'
AND sale_date<='2022-11-30';

SELECT * 
FROM retails_sales
WHERE category='Clothing' 
AND quantiy >= 4 
AND MONTH(sale_date)=11
AND YEAR(sale_date)=2022;

-- Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category ,
sum(total_sale) as Total_sales,
count (*) as Total_orders
from retails_sales
group by category;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category
SELECT category,AVG(age) as avg_age
from retails_sales
group by category
having category='Beauty';


SELECT AVG(age) as avg_age
from retails_sales
where category='Beauty';

-- Write a SQL query to find all transactions where the total_sale is greater than 1000
SELECT * 
FROM retails_sales
WHERE total_sale > 1000;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT gender ,category, count(transactions_id) as Total_number
from retails_sales
group by gender,category
order by gender,category;

-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM retails_sales
GROUP BY YEAR(sale_date), MONTH(sale_date);


WITH Monthly_avg AS (
     SELECT
	   YEAR(sale_date) AS YEAR_sale,
	   MONTH(sale_date) AS MONTH_sale,
	   AVG(total_sale) AS avg_sale
	   FROM retails_sales
	   GROUP BY 
	       YEAR(sale_date),
		   MONTH(sale_date)
)
SELECT 
    YEAR_sale,
	MONTH_sale,
	avg_sale
FROM (
   SELECT * ,
         RANK() OVER (
		     PARTITION BY YEAR_sale
			 ORDER BY avg_sale DESC
			 ) AS Rnk
  from Monthly_avg
) T
WHERE Rnk=1
ORDER BY YEAR_sale;

	        
-- Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT top 5 customer_id , sum(total_sale) as total_sale
FROM retails_sales
group by customer_id
order by total_sale desc;


SELECT TOP 4 customer_id , sum(total_sale) as total_sale
FROM retails_sales
GROUP BY customer_id
ORDER BY total_sale desc;

-- Write a SQL query to find the number of unique customers who purchased items from each category
SELECT 
  CASE 
      WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
      WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
  END AS Shift,
  COUNT(*) AS num_orders
FROM retails_sales
GROUP BY 
  CASE 
      WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
      WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
  END
ORDER BY 
  CASE 
      WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
      WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
      ELSE 'Evening'
  END;

 -- End Of Project      

