/*6.  Generate a report which contains the top 5 customers who received an 
average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
Indian  market. The final output contains these fields, 
		customer_code 
		customer 
		average_discount_percentage 
*/
with customer_discounts as (
			select  d.customer_code,
					c.customer,
					avg(pre_invoice_discount_pct) as avg_discount_pct
			from fact_pre_invoice_deductions d 
			join dim_customer c 
			on d.customer_code = c.customer_code
			where fiscal_year = 2021 
				and market = "India"
			group by d.customer_code,c.customer
)
select  customer_code,
		customer,
		avg_discount_pct
from customer_discounts
order by avg_discount_pct desc
limit 5;



