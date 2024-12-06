/*4.  Follow-up: Which segment had the most increase in unique products in 
2021 vs 2020? The final output contains these fields, 
		segment 
		product_count_2020 
		product_count_2021 
		difference
*/


with cte1 as (
	select p.segment,count(distinct(s.product_code)) as product_count_2020
		from fact_sales_monthly s
		join dim_product p
		on s.product_code = p.product_code
		where fiscal_year = 2020
		group by p.segment
),
cte2 as (
	select p.segment,count(distinct(s.product_code)) as product_count_2021
		from fact_sales_monthly s
		join dim_product p
		on s.product_code = p.product_code
		where fiscal_year = 2021
		group by p.segment
)
select a.segment,
		a.product_count_2020,
		b.product_count_2021,
		(product_count_2021-product_count_2020) as difference
from cte1 a
join cte2 b
on a.segment = b.segment;











