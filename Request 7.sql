/*7.  Get the complete report of the Gross sales amount for the customer  “Atliq 
Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
high-performing months and take strategic decisions. 
The final report contains these columns: 
		Month 
		Year 
		Gross sales Amount
*/
select  concat(monthname(date)," ",'(',year(date),')') as Month, 
		s.fiscal_year,
		round(sum(gross_price*sold_quantity),2) as gross_total_amount
from fact_sales_monthly s
join dim_customer c
	on s.customer_code = c.customer_code
join fact_gross_price g
	on g.product_code = s.product_code
where c.customer = 'Atliq Exclusive'
group by Month,s.fiscal_year
order by s.fiscal_year;