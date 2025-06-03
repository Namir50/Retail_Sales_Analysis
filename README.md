# Retail Sales Analysis using SQL

This project showcases a complete **Retail Sales Data Analysis** workflow using **Microsoft SQL Server**. The objective was to clean, explore, and analyze retail sales data to derive actionable business insights.

## Data Analysis and Findings

1. Sales made on 2022-11-05
   ```sql
   select * from retail_sales_tb
	     where sale_date = '2022-11-05'
   ```
   
2. All transactions where the category is 'Clothing', the quantity sold is more than or equal to 4, in the month of Nov-2022
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
   
3. Calculate the total sales (total_sale) for each category
   ```sql
   select category, sum(total_sale) as totat_sales from retail_sales_tb group by category;
   ```
   
4. Find the average age of customers who purchased items from the 'Beauty' category
   ```sql
   select avg(age) from retail_sales_tb 
				where category = 'Beauty';
   ```

6. All transactions where the total_sale is greater than 1000
   ```sql
   select * from retail_sales_tb 
		 where total_sale > 1000;
   ```

7. The total number of transactions (transaction_id) made by each gender in each category
   ```sql
   select gender,category, count(transactions_id)
   		           from retail_sales_tb
                           group by gender,category;
   ```

8. Calculate the average sale for each month. Find out best selling month in each year
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

9. Find the top 5 customers based on the highest total sales
   ```sql
   select top 5 customer_id, sum(total_sale) as total_sale 
	from retail_sales_tb 
		group by customer_id 
		order by sum(total_sale) desc;
   ```

10. The number of unique customers who purchased items from each category
   ```sql
   select category, count(distinct customer_id) as total_unique_users 
	from retail_sales_tb 
		 group by category;
   ```

11. Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
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



