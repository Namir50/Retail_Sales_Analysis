# Retail Sales Analysis SQL Project


This project showcases a complete retail sales data analysis workflow using Microsoft SQL Server. The objective is to clean, explore, and analyze retail sales data to derive actionable business insights.


### Data Analysis & Findings

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

2. **Retrieve all transactions where the category is 'Clothing',the quantity sold is more than 4, in the month of Nov-2022**:
```sql
select * from retail_sales_tb
	     where 
			category = 'Clothing'

select * from retail_sales_tb
	     where 
			quantiy >= 4

select * from retail_sales_tb
	     where 
			format(sale_date, 'yyyy-MM') = '2022-11'
```

3. **Calculate the total sales (total_sale) for each category.**:
```sql
SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1
```

4. **Find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
select category, sum(total_sale) as totat_sales from retail_sales_tb group by category;
```

5. **Find all transactions where the total_sale is greater than 1000**:
```sql
SELECT * FROM retail_sales
WHERE total_sale > 1000
```

6. **Find the total number of transactions (transaction_id) made by each gender in each category**:
```sql
select gender,category, count(transactions_id) from retail_sales_tb group by gender,category;
```

7. **Calculate the average sale for each month. Find out best selling month in each year**:
```sql
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
```

8. **Find the top 5 customers based on the highest total sales**:
```sql
select top 5 customer_id, sum(total_sale) as total_sale 
	from retail_sales_tb 
		group by customer_id 
		order by sum(total_sale) desc;
```

9. **Find the number of unique customers who purchased items from each category.**:
```sql
select category, count(distinct customer_id) as total_unique_users 
	from retail_sales_tb 
		 group by category;
```

10. **Create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
with hourly_sale as (
	select *,
	case
		when DATEPART(HOUR, sale_time) < 12 then 'Morning'
		when DATEPART(HOUR, sale_time) between 12 and 17 then 'Afternoon'
		else 'Evening'
	end as shift
	from retail_sales_tb
)
select shift, count(*) as total_order from hourly_sale group by shift;

```

## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.




