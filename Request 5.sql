/*5.  Get the products that have the highest and lowest manufacturing costs. 
The final output should contain these fields, 
	product_code 
	product 
	manufacturing_cost
*/

(
select  p.product_code,
		p.product,
        max(manufacturing_cost) as manufacturing_cost
	from fact_manufacturing_cost m 
	join dim_product p 
		on m.product_code = p.product_code
	group by p.product_code,p.product
	order by manufacturing_cost desc
	limit 1
)
union
(
select 	p.product_code,
		p.product,
        min(manufacturing_cost) as manufacturing_cost
	from fact_manufacturing_cost m 
	join dim_product p 
		on m.product_code = p.product_code
	group by p.product_code,p.product
	order by manufacturing_cost asc
	limit 1
);
