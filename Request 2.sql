/*2.  What is the percentage of unique product increase in 2021 vs. 2020? The 
final output contains these fields, 
	unique_products_2020 
	unique_products_2021 
	percentage_chg 
*/

select x.unique_product_2020, 
	y.unique_product_2021,
	(unique_product_2021-unique_product_2020)*100/unique_product_2020 as percentage_chg
from (
	(select count(distinct(product_code)) as unique_product_2020 
		from fact_sales_monthly 
		where fiscal_year = 2020) x,
	(select count(distinct(product_code)) as unique_product_2021 
		from fact_sales_monthly 
        where fiscal_year = 2021) y
);





 




