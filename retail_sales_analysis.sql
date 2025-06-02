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