Filtering Data: Using WHERE clause

Aggregating Data: SUM, COUNT, AVG, MIN, MAX with GROUP BY to summarize data.

Joining Data

type conversion functions: toInt32, toString, toUpper, toDateTime, toDate, toUUID

CAST(value AS Type) or value :: Type
'examples: '
select CAST('123' AS Int32) as str_to_int
select 123.456 :: Decimal(10, 2) as float_to_decimal




'string Manipulation'
select substring('Srishti Pare', 8, 4)
select substring('SrishtiPare', 8,4)

select position('Hello world world hello', 'world')
select position('Hello world world hello', 'World')

select startsWith('Clickhouse', 'Cli')
'try endsWith also'

select replace('Hello World', 'World', 'Srishti') as greet

select lower('SRISHTI') AS name
'try upper also'

select trim('     click   house  ')

select concat('firstName', '@gmail.com') as mail_id
'suppose I have firstname and lastname column then concat() function works as below: '
select concat(firstname, ' ', lastname) as full_name    



'Conditional Logic (CASE Statements)'
select `Product Name`, price, case
	when price > 100 then 'Expensive'
	when price between 50 and 100 then 'Affordable'
	else 'Cheap'
end as price_category
from practicedb.product 
limit 25



'to remove duplicates'
optimize table table_name final deduplicate




create table new(product_name String, quantity float, price float, revenue float materialized quantity*price)
order by product_name


insert into new(product_name, quantity, price)
select `Product Name`, `Units Sold`, price from practicedb.product

set asterisk_include_materialized_columns = 1


select * from new


























