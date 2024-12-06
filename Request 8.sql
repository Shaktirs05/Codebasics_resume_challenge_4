/*8.  In which quarter of 2020, got the maximum total_sold_quantity? The final 
output contains these fields sorted by the total_sold_quantity, 
	Quarter 
	total_sold_quantity 
*/
-- Query to categorize sales data into quarters and sum the sold quantities for each quarter
select 
	case 
		when date between '2019-09-01' and '2019-11-01' then 1
		when date between '2019-12-01' and '2020-02-01' then 2
		when date between '2020-03-01' and '2020-05-01' then 3
		when date between '2020-06-01' and '2020-08-01' then 4
	END as Quarters,
	sum(sold_quantity) as total_sold_quantity
from 
	fact_sales_monthly
where 
	fiscal_year = 2020
group by 
	Quarters
order by 
	total_sold_quantity desc;

-- Query to categorize sales data into quarters with month names and sum the sold quantities for each quarter
select
	case
		when date between '2019-09-01' and '2019-11-01' then concat('[',1,']',monthname(date))
		when date between '2019-12-01' and '2020-02-01' then concat('[',2,']',monthname(date))
		when date between '2020-03-01' and '2020-05-01' then concat('[',3,']',monthname(date))
		when date between '2020-06-01' and '2020-08-01' then concat('[',4,']',monthname(date))
	END as Quarters,
	sum(sold_quantity) as total_sold_quantity
from 
	fact_sales_monthly
where 
	fiscal_year = 2020
group by 
	Quarters;
  


