/*10.  Get the Top 3 products in each division that have a high 
total_sold_quantity in the fiscal_year 2021? The final output contains these 
fields, 
	division 
	product_code
	product 
	total_sold_quantity 
	rank_order
*/

with output1 as(
	select  p.division,
			p.product_code,
            p.product,sum(sold_quantity) as total_sold_quantity
from 
	fact_sales_monthly m
join dim_product p
	on m.product_code = p.product_code
where 
	fiscal_year = 2021
group by 
	p.division,
    p.product_code,
    p.product
),
output2 as (
select  division,
		product_code,
        product,
        total_sold_quantity,
rank() over (partition by division order by total_sold_quantity desc) as rank_order
from output1
)
select  a.division,
		a.product_code,
		a.product,
		a.total_sold_quantity,
		b.rank_order
from 
	output1 a
join output2 b
	on a.product_code = b.product_code
where b.rank_order in (1,2,3);





