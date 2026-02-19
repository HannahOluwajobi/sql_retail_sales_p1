select *
from retail;

select count(DISTINCT customer_id) as total_customer
from retail;

select DISTINCT category
from retail;

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT *
FROM retail
where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT category, sum(quantiy)
FROM retail
WHERE category = 'Clothing'
GROUP BY 1;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, sum(total_sale), count(*) as total_orders
FROM retail
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT category, avg(age)
FROM retail
where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT *
FROM retail
where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT category, count(transactions_id), gender
FROM retail
GROUP BY gender, category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT YEAR(sale_date) as year,MONTH(sale_date) as month, AVG(total_sale)
from retail
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT customer_id, sum(total_sale) as total_sale
FROM retail
GROUP BY customer_id
ORDER BY  total_sale desc 
limit 5;


-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT count(distinct customer_id) as customer_id, category
FROM retail
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening 

WITH hourly_sale AS (
SELECT *,
CASE
	WHEN EXTRACT(HOUR from sale_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
    END AS shift
FROM retail
)
SELECT
	shift,
    COUNT(*) as toatal_orders
FROM hourly_sale
GROUP BY shift;

-- END OF PROJECT


