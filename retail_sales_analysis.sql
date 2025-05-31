use retail_sales_data;

select * from retail_sales_tb;

alter table retail_sales_tb
alter column sale_date DATE;

alter table retail_sales_tb
alter column sale_time TIME(0);


SELECT TOP 10 *  from retail_sales_tb ;

--total number of rows
Select count(*) from retail_sales_tb;