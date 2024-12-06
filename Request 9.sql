/*9.  Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?  
The final output  contains these fields, 
channel 
gross_sales_mln 
percentage 
*/
with output as (
	select  c.channel,
			round(sum(g.gross_price*m.sold_quantity)/1000000,2) as gross_sales_mln
from 
	fact_sales_monthly m 
join dim_customer c
	on c.customer_code = m.customer_code
join fact_gross_price g
	on g.product_code = m.product_code
where 
	m.fiscal_year = 2021
group by 
	c.channel
)
select channel,
	concat(gross_sales_mln,' M') as gross_sales_mln , 
	concat(round(gross_sales_mln*100/total,2),' %') as percentage
from (
(select sum(gross_sales_mln) as total 
	from output) x,
(select * 
	from output) y
)
order by percentage desc;
