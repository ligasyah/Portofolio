--Soal 1
select 
	c.gender, c.city, 
	c.email, 
	t.customer_id, 
	count(t.id) as transaction
from datasource_sql_ds14.customer as c 
left join 
	datasource_sql_ds14.transaction as t on c.id = t.customer_id 
where 
	c.gender = 'Female' and c.city = 'Jakarta' and c.email = 'Gmail'
group by 
	1,2,3,4
having 
	count(t.id) >= 10 
order by 
	count(t.id) 


--Soal 2
select
	p.id as "product_id",
	sum(quantity) as "total_transaction"
from datasource_sql_ds14.product p
left join
	datasource_sql_ds14.transaction t on p.id = t.product_id
where
	t.created_at between '2018-10-01' and '2018-12-31'
group by
	p.id
having
	sum (quantity) > avg(quantity)
order by 
	count(t.id) desc
limit 5

--Soal 3
select 
	s.type,
	c.gender, 
	count(t.id) as "Quantity", 
	c.city,
	case		
		when c.city = 'Jakarta' then 'Jakarta'
		else 'Outside Jakarta' 
	end
from 
	datasource_sql_ds14.store as s
left join 
	datasource_sql_ds14.transaction as t on s.id = t.store_id 
left join 
	datasource_sql_ds14.customer as c on t.customer_id = c.id 
group by 
	1,2,4
order by
	5 ,3 desc 
	 



