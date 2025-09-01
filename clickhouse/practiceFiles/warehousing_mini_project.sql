                          'Executive Sales Summary OLAP Dashboard'
                          
                          select * from practicedb.product limit 10

'Tasks
Monthly sales growth
Top 3 performing regions YoY
Category trends by season'
--------------------------------------------------------

create VIEW monthly_sales_growth as
with cte as(
select toMonth(date) as month, round(sum(revenue),2) as monthly_revenue, 
lag(monthly_revenue) over() as prev_month_revenue 
from practicedb.product 
group by month)
select month, monthly_revenue, round(((monthly_revenue-prev_month_revenue)/monthly_revenue)* 100,2)
as growth_rate
from cte 

select * from monthly_sales_growth

-----------------------------------------------------------------------------------------------------------

create view regional_performance as 
select toYear(date) as year, location, sum(revenue) as total_revenue 
from practicedb.product
group by year, location  
order by total_revenue desc
limit 3 by year

select * from regional_performance

-----------------------------------------------------------------------------------------------------------

create view seasonal_category_trend as 
select 
case 
	when toMonth(date) in (3,4,5,6) then 'summer'
    when toMonth(date) in (7,8,9) then 'rainy'
    when toMonth(date) in (11,12,1,2) then 'winter'
    else 'autumn'
end as season, category, sum(`Units Sold`) total_sale
from practicedb.product 
group by season, category 
order by season, total_sale desc



select * from seasonal_category_trend

-------------------------------------------------------------------------------------------------------------


'Exporting to csv'
1) connect to clickhouse-server
2) use clickhouse -client to perfrom required action; write below syntax 

clickhouse-client --user=Srishti --password='Srishti@13' --query=
"SELECT * FROM tablename FORMAT CSV" > file_path+new_file_name



'Exporting to paraquet'

SELECT *
FROM practicedb.product
INTO OUTFILE '/home/developer/Desktop/clickhouse-setup/new.parquet'
FORMAT Parquet;

-------------------------------------------------------------------------------------------------------------


'command-line utilities for interacting with ClickHouse'

'clickhouse-client: command-line interface for connecting to and interacting with a running ClickHouse server'

'clickhouse-local: provides a standalone, serverless ClickHouse engine that runs directly from 
the command line on your local machine. It does not require a running server instance or complex configuration'
'{able to operate independently of other hardware or software}'

The primary use case for clickhouse-local is to query data directly from local files.
ex:   ./clickhouse local -q "SELECT * FROM 'your_file.csv'"


--------------------------------------------------------------------------------------------------------------


'Practicing materialized view'
Daily total sales per country:


'Target Table:'
create table daily_country_sales(location String, date date, total_sales float)
order by date


create materialized view daily_country_sale_mv to daily_country_sales as
select location, Date(date) as date, `Product Name`, sum(revenue) as total_sales, sum(`Units Sold`) as quantity  
from practicedb.product
group by location, date, `Product Name`
order by location, date desc



insert into practicedb.product(date, `Product Name`, location, revenue)
values
('2025-07-13', 'Rice', 'Japan', 400),
('2025-07-13', 'Wheat', 'Japan', 500),
('2025-07-14', 'Rice', 'India', 490),
('2025-07-14', 'Garlic', 'India', 350),
('2025-07-14', 'weed', 'Singapore', 750)


select * from daily_country_sales


alter table daily_country_sales 
add column quantity float,
add column `Product Name` String



-------------------------------------------------------------------------------------------------------------






































