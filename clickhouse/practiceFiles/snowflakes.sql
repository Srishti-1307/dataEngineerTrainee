show tables in stars

select * FROM  stars.customer

alter table stars.customer 
drop column address

alter table stars.customer 
drop column city

alter table stars.customer 
add column address_id varchar


'creating sub dimension table'
create table stars.customer_address(address_id varchar, house_no varchar, city String, state String)
order by address_id

select * from stars.sales_fact


-------------------------------------------------------------------------------------------------------------------------------

'Denormalization'

create table stars.denorm_salesFact 
order by sales_id 
as  
select * from stars.sales_fact as sf
left join stars.customer as c on c.customer_id = sf.customer_id
left join stars.customer_address as ca on ca.address_id = c.address_id
left join stars.product as p on p.product_id = sf.product_id
left join stars.store as s on s.store_id = sf.store_id
left join stars.time_dim as t on t.date_id = sf.date_id


select * from stars.denorm_salesFact 


-------------------------------------------------------------------------------------------------------

'Group by Family'

'group by cube: calculates subtotals for all possible combinations of the key 
expressions specified in the GROUP BY list'
select Platform, location, category, sum(revenue) from practicedb.product
group by cube (Platform, location, category)


'vs group by rollup: calculates subtotals by making hierarchy'
select Platform, location, category, sum(revenue) from practicedb.product
group by rollup (Platform, location, category)


'vs group by grouping sets'
select Platform, location, category, sum(revenue) from practicedb.product
group by grouping sets ((Platform, location, category), (location, category), (Platform), ())


'vs regular group by'
select Platform, location,category, sum(revenue) from practicedb.product
group by (Platform, location, category)


-----------------------------------------------------------------------------------------------------------




'WITH TOTALS ONLY WORK WITH CLICKHOUSE-CLIENT'

Subtotals via WITH TOTALS
select Platform, sum(revenue) from practicedb.product
group by Platform
WITH TOTALS;


select customer_id, sum(order_id) from testdb.orders 
group by customer_id 
with totals 


-----------------------------------------------------------------------------------------------

'UNION ALL'

select customer_id from testdb.customers 
union all
select order_id from testdb.orders

'considerations for union all
SELECT statements in a UNION ALL operation must have the same number of columns,
and the corresponding columns must have compatible data types.'

--------------------------------------------------------------------------------------------------------


'roll up'
select Platform, location, category, sum(revenue) from practicedb.product
group by rollup (Platform, location, category)


'simulating roll up by group by+union all'
select Platform,  sum(revenue) from practicedb.product
group by (Platform, location, category)
union all
select Platform, sum(revenue) from practicedb.product
group by (Platform, location)
union all
select Platform, sum(revenue) from practicedb.product
group by Platform




--------------------------------------------------------------------------------------------------------












