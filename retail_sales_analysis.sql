use retail_sales_data;

select * from retail_sales_tb;

alter table retail_sales_tb
alter column sale_date DATE;

alter table retail_sales_tb
alter column sale_time TIME(0);


SELECT TOP 10 *  from retail_sales_tb ;

--total number of rows
Select count(*) from retail_sales_tb;


select * from retail_sales_tb
where transactions_id is null

select * from retail_sales_tb
where
	transactions_id is null
	or
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	age is null
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


--deleting rows with null values
delete from retail_sales_tb
where
	transactions_id is null
	or
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	age is null
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

select count(*) from retail_sales_tb;

--DATA EXPLORATION

--how many sales we have?
select count(*) as total_sale from retail_sales_tb;

--number of custmers?
select count(Distinct customer_id) from retail_sales_tb;

--total sales with respect to gender
select gender, sum(total_sale) from retail_sales_tb group by gender;

--category or products
select distinct category from retail_sales_tb;

--DATA ANALYSIS

--Write a SQL query to retrieve all columns for sales made on '2022-11-05:
select * from retail_sales_tb
	     where sale_date = '2022-11-05'

--Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than or equal to 4 in the month of Nov-2022:
select * from retail_sales_tb
	     where 
			category = 'Clothing'

select * from retail_sales_tb
	     where 
			quantiy >= 4

select * from retail_sales_tb
	     where 
			format(sale_date, 'yyyy-MM') = '2022-11'

--Write a SQL query to calculate the total sales (total_sale) for each category
select category, sum(total_sale) as totat_sales from retail_sales_tb group by category;

--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select avg(age) from retail_sales_tb 
				where category = 'Beauty';

--Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales_tb 
		 where total_sale > 1000;

--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select gender,category, count(transactions_id) from retail_sales_tb group by gender,category;

--Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
WITH monthly_avg AS (
  SELECT 
    YEAR(sale_date) AS sale_year,
    MONTH(sale_date) AS sale_month,
    AVG(total_sale) AS avg_sale,
    ROW_NUMBER() OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS rn
  FROM retail_sales_tb
  GROUP BY YEAR(sale_date), MONTH(sale_date)
)
SELECT sale_year, sale_month, avg_sale
FROM monthly_avg
WHERE rn = 1
ORDER BY sale_year;

--Write a SQL query to find the top 5 customers based on the highest total sales
select top 5 customer_id, sum(total_sale) as total_sale 
	from retail_sales_tb 
		group by customer_id 
		order by sum(total_sale) desc;

--Write a SQL query to find the number of unique customers who purchased items from each category
select category, count(distinct customer_id) as total_unique_users 
	from retail_sales_tb 
		 group by category;