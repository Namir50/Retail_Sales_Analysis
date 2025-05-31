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