select * from practicedb.product
select * from practicedb.product_info

delete from practicedb.product where toMonth(date) = 7

WINDOW FUNCTIONS
27. Rank products by revenue within each category.
28. Show cumulative revenue for each product.
29. Calculate difference in units sold between days.
30. Show moving average of revenue over last 3 days (assume multiple dates).



#27
select category,`Product Name`, sum(revenue),
rank() over(partition by `category` order by sum(revenue) desc) as r
from practicedb.product 
GROUP BY category,`Product Name`


#28
select 	`Product Name`, sum(revenue) over(partition by `Product Name`) as cumulative_sum
from practicedb.product 
limit 1 by cumulative_sum


#29
with new as(
select `date`, sum(`Units Sold`) as total_sold, lag(`total_sold`) over() as prev_day_sale
from practicedb.product 
group by date
order by date)

select *, (total_sold - prev_day_sale) as difference from new


#30
select date, sum(revenue) as total_revenue,
avg(total_revenue) over(rows between 2 preceding and current row) as rolling_avg
from practicedb.product group by date



#extra: What is the average daily revenue per month?
select month(date) as months, sum(revenue) as total_revenue, avg(total_revenue) over() as average_revenue
from practicedb.product
group by months



JOINS
31. Join with a `product_info` table to show supplier name per product.
32. Get all products supplied by "HealthCore Inc.".
33. Compare revenue with industry average from a `category_benchmarks` table.



create table practicedb.product_info(category String, supplier_name String, city String )
order by supplier_name

insert into practicedb.product_info values
('Protien', 'HealthCore Inc', 'Jaipur'),
('Herbal', 'Himalaya', 'Jaipur')
('Vitamin', 'Dailyneeds', 'Nagpur'),
('Protein', 'Himalaya', 'Patna')
('Mineral', 'Dailyneeds', 'Ahemdabad'),
('Herbal', 'Himalaya', 'Nagpur'),
('Mineral', 'Mamaearth', 'Pune'),
('Omega', 'HealthCore Inc', 'Ranchi'),
('Mineral', 'Mamaearth', 'Ahemdabad'),
('Herbal', 'Himalaya', 'Patna'),
('Protien', 'HealthCore Inc', 'Goa')

select * from practicedb.product_info


#31
select p.category, pi.supplier_name from practicedb.product as p
inner any join practicedb.product_info as pi
on p.category = pi.category
order by p.category



#extra1: find which city has highest sale 
select pi.city, sum(p.revenue) as total_revenue from practicedb.product as p 
join practicedb.product_info as pi
on p.category = pi.category
group by pi.city
order by total_revenue desc 
limit 1


#extra2: month-wise calculate which city has highest sale
select month(p.date) as months, sum(p.revenue) as total_revenue, pi.city from practicedb.product as p
join practicedb.product_info as pi
on p.category = pi.category
group by p.date, pi.city
order by months, total_revenue desc
limit 1 by months


#32
select  distinct p.category,pi.supplier_name from practicedb.product p 
join practicedb.product_info pi
on p.category=pi.category
where pi.supplier_name = 'HealthCore Inc'




CTE AND SUBQUERIES
34. Use a CTE to calculate return rate and show top 5 products by that.
35. Show all products with units sold above the category average.
36. Find the maximum revenue product per location using a subquery.
37. Select records where price is above average for its category.


#34
with cte as(
select `Product Name`, sum(`Units Sold`) as total_sold, sum(`Units Returned`) as total_returned
from practicedb.product 
group by `Product Name`)
select cte.`Product Name`, round((100-(((cte.total_sold - cte.total_returned)/ cte.total_sold)*100)),2)
as percentage_returned from cte
order by percentage_returned desc 
limit 5


#35 
with cte as( 
select category, round(avg(`Units Sold`),2) as avg_units_sold from practicedb.product 
group by category )
select p.`Product Name`, p.`Units Sold`from practicedb.product as p
join cte as c
on c.category = p.category 
where p.`Units Sold` > c.avg_units_sold 


#36 
with cte as (select location, `Product Name`, sum(revenue) as total_revenue
from practicedb.product p group by location, `Product Name`)

select `Product Name`, cte.total_revenue as revenue from cte
where revenue in (
select max(total_revenue) from (select location, `Product Name` , sum(revenue) as total_revenue
from practicedb.product group by location, `Product Name` )
group by location )



#37
with cte as (select category, avg(price) as avg_price from practicedb.product  group by category)

select * from practicedb.product as x 
join cte 
on x.category = cte.category
where x.category = cte.category and x.price> cte.avg_price






Analytics & Quality Checks
42. Identify products with more units returned than sold (anomaly).
43. Find days with extremely high discounts (> 50%).
44. Detect categories with falling monthly revenue trend (assume more dates).
45. Analyze top 3 categories contributing to total revenue.



#42 
SELECT `Product Name` FROM practicedb.product 
WHERE `Units Sold` < `Units Returned`



#43
select distinct date from practicedb.product where discount > 0.5



#44
WITH CTE AS (
select category, toYYYYMM(date) as m, sum(revenue) as total_revenue, lag(total_revenue, 1,0) 
over(partition by category order by m) as prev_month_col from practicedb.product
group by category, m
order by category, m)
select DISTINCT category from CTE
where total_revenue < prev_month_col 


#45 
select category, sum(revenue) as r from practicedb.product 
group by category
order by r desc 
limit 3





Advanced Aggregation
46. Find the average price of returned products.
47. Compute weighted average price per category.
48. Get the standard deviation of discounts for each platform.
49. Show top 5 platforms by sales volume.


#46
select sum(`Units Returned`) as total_returned , round(avg(price),2) as avg_price ,category from practicedb.product 
group by category 
having total_returned > 0


#47
select category, round(sum(price * (`Units Sold` - `Units Returned`))/ sum(`Units Sold` - `Units Returned`),2) 
from practicedb.product
group by category


#48
select Platform, std(discount) from practicedb.product 
group by Platform


#49
sales volume = sum of Units Sold 
select Platform, sum(`Units Sold`) as total_vol from practicedb.product 
group by Platform
order by total_vol desc 
limit 5


ClickHouse Specific
50. Create a materialized view for daily revenue tracking.
51. Partition the table by month using MergeTree.
52. Use `LowCardinality(String)` for better performance – compare query times.
53. Create a TTL to delete data older than 1 year.
54. Simulate approximate count with `uniqExact()` and `uniq()` functions.
55. Use `quantile()` to find 90th percentile revenue per category.


#50
Target Table
create table revenue_tracker(date Date, product_name String, category String, revenue Float32) 
order by date

Mv
create materialized view mv_revenue_tracker to revenue_tracker as
(select DATE(date) as date, `Product Name` as product_name, category, sum(revenue) as revenue from practicedb.product
group by date, category, product_name)

select * from revenue_tracker




#51
alter table practicedb.product modify partition by toYYYYMM(date)



#52. Use `LowCardinality(String)` for better performance – compare query times.
alter table practicedb.product modify column Platform LowCardinality(String)

'For rechecking'
show create table practicedb.product




#53 
alter table practicedb.product modify TTL date + interval 1 year


#54
select count(*), uniqExact(*) as uniqExact, uniq(*) as uniq from practicedb.product

'
uniq()
The uniq() function calculates the approximate number of different values of the argument.
It uses an adaptive sampling algorithm and is designed for high performance, especially on large datasets,
at the cost of slight inaccuracy (typically around 0.1% error).


uniqCombined()
The uniqCombined() function also calculates the approximate number of different argument values. 
It utilizes a combination of algorithms (array, hash table, and HyperLogLog with an error correction table) 
to achieve a balance between accuracy and performance. 
It generally offers higher accuracy than uniq() while still being efficient.


uniqExact()
The uniqExact() function calculates the exact number of different argument values. 
It provides 100% accuracy but can consume significantly more memory and be slower than uniq() or uniqCombined(), 
especially for columns with a very large number of distinct values, as its state size grows 
with the number of unique elements. 
'


#55
'percentile: For example, if someone scores at the 90th percentile on a test, 
it means their score is better than 90% of the other test-takers. 
The 90th percentile specifically signifies the point where 90% of the data falls below that point, 
and 10% falls above it.' 

'Calculating the 90th percentile of price means finding the price value below which 90% of all other prices
in a given dataset fall.'

select category, round(quantile(0.9)(revenue),2) as revenue_90percent_quantile from practicedb.product
group by category
order by revenue_90percent_quantile





Exploratory data analysis 
56. Show top 3 products with highest return rate per platform.
57. Find platforms with lowest average revenue per product.
58. List products that are available in more than two countries.
59. Identify which location had the most product diversity.
60. Compare sales performance between “Walmart” and “Amazon”.



#56




#57
select Platform, `Product Name`, round(avg(revenue),2) avg_revenue  from practicedb.product 
group by Platform, `Product Name`
order by Platform,  avg_revenue 
limit 1 by Platform



#58
select `Product Name`  from practicedb.product 
group by `Product Name` 
having count(distinct location) > 2


#59  Identify which location had the most product diversity.
select location, count(distinct `Product Name`) c from practicedb.product
group by location 
order by c desc
limit 1



#60
SELECT Platform,  round(sum(revenue),2) as sales from practicedb.product
where Platform in ('Walmart', 'Amazon')
group by Platform 







Trend Analysis
61. Calculate month-over-month revenue growth per category.
62. Show rolling 7-day average revenue for all platforms (assume more dates).
63. Compare Q1 vs Q2 performance for each product (assume full date range).
64. Visualize revenue spike days using percentile thresholds.
65. Track increase/decrease in units sold by product each month.



#61
select toMonth(date) as months, category, round(sum(revenue),2) as total_revenue from practicedb.product 
group by category, months
order by category, months



#62
with cte as(
select Platform, date, sum(revenue) total_revenue from practicedb.product 
group by Platform, date
order by date)
select Platform, date, avg(total_revenue) over(partition by Platform order by date ROWS BETWEEN 6 PRECEDING 
AND CURRENT ROW) as rolling_avg from cte





'
# extra second highest sale for each category per platform
'
with cte as (
select Platform, category, sum(revenue) as total_sale from practicedb.product  
group by Platform, category  
) 
select Platform, category, total_sale from (select Platform, category, total_sale, rank() over(partition by Platform 
order by total_sale desc) as r from cte) 
where r = 2





Track increase/decrease in units sold by product each month.
#65
select toMonth(date) as months, `Product Name`,  sum(`Units Sold`) as units_sold from practicedb.product 
group by months, `Product Name`
order by months





Performance metrics AL
66. Calculate conversion rate as `(Units Sold) / (Units Sold + Units Returned)`.
67. Find which category has the highest average price-to-revenue ratio.
68. Analyze return cost per product (`Units Returned * Price`).
69. Create a profitability score: `Revenue - (Units Sold * Cost)` (assume cost = 0.7 * price).
70. Determine discount efficiency: extra revenue per 1% discount.



#66
select category, (`Units Sold`) / (`Units Sold` + `Units Returned`) as conversion_rate from practicedb.product 


#67
select category, avg(price/revenue) as price_revenue_ratio from practicedb.product 
group by category
order by price_revenue_ratio desc 
limit 1 by category


#68
select `Product Name`, sum(`Units Returned` * price) as return_cost from practicedb.product p 
group by `Product Name`


#69
select `Product Name`,  (revenue - (`Units Sold` * 0.7*price)) as profitability_score from practicedb.product p 






Data Validation & Audits
71. Find all records where Revenue != (Units Sold * Price * (1 - Discount)).
72. Detect duplicate records based on Product, Date, and Platform.
73. Identify rows where the same product appears on multiple platforms on the same date.
74. Check if any product is missing category values.
75. List products with unusually high prices (above 2x the category average).



#71
select * from practicedb.product 
where revenue != (`Units Sold` * price * (1 - discount))



#72
select `Product Name`, Platform, date, count(*) from practicedb.product
group by `Product Name`, Platform, date
having count(*) > 1


#73
select date, `Product Name`, count(Platform) from practicedb.product 
group by date, `Product Name`
having count(Platform) > 0
order by date, `Product Name`


#74
select `Product Name` from practicedb.product  
where category is null



#75
with cte as(
select category, avg(price) as avg_price from practicedb.product  
group by category)

select p.`Product Name`, p.price from practicedb.product as p 
join cte as c 
on p.category = c.category
where p.price*2 > c.avg_price





Nested Aggregation / Multiple Groupings
76. Show median units sold per category.
77. Compare revenue per unit across different locations.
78. Group by Category & Platform to find best performing combos.
79. Show product count and average price for each (Location, Platform) pair.
80. For each category, show revenue breakdown per country.



#76
select category, median(`Units Sold`) from practicedb.product  
group by category


#77
with cte as(
select `Product Name`, round(sum(revenue/`Units Sold`),2) as revenue_per_unit  from practicedb.product 
group by  `Product Name` ) 
select p.location, round(sum(c.revenue_per_unit),2) as revenue_per_unit_by_location from practicedb.product as p 
join cte as c    
on p.`Product Name` = c.`Product Name` 
group by location



#78
select Platform,  category, sum(revenue) as total_revenue from practicedb.product   
group by Platform, category
order by Platform, total_revenue desc

or

select category, Platform, sum(revenue) as total_revenue from practicedb.product   
group by category, Platform
order by category, total_revenue desc



#79 
select location, Platform, count(`Product Name`) as product_count, avg(price) as avg_price from practicedb.product  
group by location, Platform
order by location, Platform



#80 
select location, category, sum(revenue) as total_revenue 
from practicedb.product  
group by location, category
order by location



Advanced Window & Ranking
81. Show `dense_rank()` of each product by revenue globally.
82. Calculate the lag in units sold from previous day per product.
83. Use `nth_value()` to find the second highest selling product in each category.
84. Display total and relative contribution of each product to its category revenue.
85. Create a rank percentile column for products within each platform.



#81
select location, `Product Name`, sum(revenue) as total_revenue,
dense_rank() over(order by total_revenue) as dense_rank  
from practicedb.product
group by location, `Product Name`
order by location


#82
select date, sum(`Units Sold`) as total_sold, lag(total_sold) over() as prev_day_sold
from practicedb.product 
group by date



#83  Use `nth_value()` to find the second highest selling product in each category.
Try  nth_value(exp, n) 
select category, nth_value(price, 2) over(partition by category) as second_price from practicedb.product

cross checking

select category, price from practicedb.product 
where category= 'Amino Acid'

#83
with cte as(
select category, `Product Name`, sum(`Units Sold`) as total_selling from practicedb.product
group by category, `Product Name`
order by category, `Product Name`, total_selling desc)
select category, nth_value(total_selling, 2) over(partition by category) from cte
limit 1 by category


'Validation'
select category, `Product Name`, sum(`Units Sold`) as total_selling from practicedb.product
group by category, `Product Name`
having category = 'Vitamin'


#84
with cte as (
select category, sum(revenue) as category_total_revenue from practicedb.product  
group by category) 
select p.category, p.`Product Name`, c.category_total_revenue, sum(p.revenue) as total_revenue_contribution , 
((sum(p.revenue)/c.category_total_revenue) *100) as relative_revenue
from practicedb.product p
left join cte c
on p.category = c.category 
group by p.category, p.`Product Name`, c.category_total_revenue 
order by p.category



#85 Create a rank percentile column for products within each platform.
with cte as (
select Platform, `Product Name`, sum(revenue) as total_revenue from practicedb.product 
group by Platform , `Product Name`) 
select Platform, `Product Name`, total_revenue, (PERCENT_RANK() over(order by total_revenue) * 100) as percent_rank 
from cte






Data Modeling and Optimization
86. Simulate materialized view to track “top 5” products per category monthly.
87. Use `Map` datatype to associate categories with number of distinct platforms.
88. Use `Nested` column simulation for customer feedback scores (e.g., stars, comments).
89. Test the performance of MergeTree vs SummingMergeTree for revenue aggregations.
90. Add a `Version` column to track changes and dedup via `FINAL` modifier.


 

#86
'Source table:'

CREATE TABLE practicedb.product_target
(
    `date` Date,
    `product_name` String,
    `category` String,
    `price` Float32,
    `revenue` Float32,
    `discount` Float32,
    `location` String,
    `Platform` LowCardinality(String),
    `Product Name` String,
    `Units Sold` Int32,
    `Units Returned` Int32
)
ENGINE = MergeTree
ORDER BY product_name
TTL date + toIntervalYear(1)
SETTINGS index_granularity = 8192


'Target Table:'

create table practicedb.productTarget(months date, product_name String, category String, revenue Float32, rnk int) 
order by months


'creating view'
create materialized view product_mv to practicedb.productTarget as(
select toMonth(date) as months, `Product Name` as product_name, category as category, sum(revenue) as revenue,
rank() over(order by revenue desc) as rnk from practicedb.product_target
group by months, category, product_name)


'inserting data into target table'
insert into practicedb.product_target
select * from practicedb.product


'Quering target table'
select * from practicedb.productTarget






'Trying map() data type'
CREATE TABLE my_table (id UInt64, attributes Map(String, String)) ENGINE = Memory;

INSERT INTO my_table VALUES
(1, map('name', 'Srishti', 'age', 'twenty', 'xxxxxoooo', 'yyyyooo')),
(5, map('food', 'pasta', 'color', 'pink'));


SELECT id, attributes['name'] as name_value, attributes['xxxxxoooo'] as xoxo_value , attributes['age'] as age_value
FROM my_table;

select * from my_table 


Use `Map` datatype to associate categories with number of distinct platforms.







Data Transformation / ETL Simulation
91. Simulate currency conversion of revenue (e.g., multiply by exchange rate table).
92. Normalize discounts using min-max scaling within each platform.
93. Transform units sold to percent of total per platform.
94. Flatten a dataset where each product has multiple rows (one per region).
95. Derive new column for `Net Profit = Revenue - (Returned Units * Price)`.


#92
(X - Xmin) / (Xmax - Xmin)
select Platform, discount, ((discount - (min(discount) over(partition by Platform)) ) / 
((max(discount) over(partition by Platform))-(min(discount) over(partition by Platform)))) as normalised from 
practicedb.product


#93
select Platform, (sum(`Units Sold`)/
(select sum(`Units Sold`) as total from practicedb.product))*100
from practicedb.product
group by Platform



#94 Flatten a dataset where each product has multiple rows (one per region).
select location, `Product Name`, max(revenue) from practicedb.product
group by location, `Product Name`
order by location



#95 Derive new column for `Net Profit = Revenue - (Returned Units * Price)`.
select `Product Name`, price, revenue, (revenue - (`Units Returned` * price)) as `Net Profit` 
from practicedb.product 
order by `Product Name`
]





Exploratory Metrics Engineering
96. Calculate z-score of price per category for outlier detection.
97. Detect products whose daily revenue is consistently above 1 std dev from average.
98. For each platform, show which product contributes most to returned units.
99. Compute the return ratio per product and sort by highest to lowest.
100. Use `argMax()` to find product with highest revenue on each date.




#96 z-score: (x-mean)/std
select category, (sum(price) - avg(price))/std(price) as `z-score`
from practicedb.product 
group by category


#97 ------------INCOMPLETE-------------------
select date, `Product Name`, revenue 
from practicedb.product 
where revenue = 
order by date


#98 
with cte as (SELECT Platform, `Product Name`, sum(`Units Returned`) as total_units_returned from practicedb.product 
group by Platform, `Product Name`)   
select Platform, `Product Name`, max(total_units_returned) as highest_return_count from cte
group by Platform, `Product Name`
order by Platform, highest_return_count desc   
limit 1 by Platform


#99 Compute the return ratio per product and sort by highest to lowest.
select `Product Name`, sum(`Units Returned`)/sum(`Units Sold`) as return_ratio from practicedb.product 
group by `Product Name` 
order by return_ratio desc




select `Product Name`, sum(`Units Returned`)/(select sum(`Units Returned`) from practicedb.product)
as return_ratio from practicedb.product 
group by `Product Name` 
order by return_ratio desc



#100 
ARGMAX(argument_column, value_column)-
arg: The column whose value you want to retrieve.
val: The column based on which the maximum value is determined.



select date, argMax(`Product Name`, revenue), max(revenue ) from practicedb.product
group by date
order by date


'Validation'
select date, `Product Name`, sum(revenue) as total_revenue  from practicedb.product
group by date, `Product Name` 
order by date, total_revenue desc



'Extra questions'
1. Identify the top 5 products by total returned units across all platforms.
2. Calculate the net sales per category, where Net Sales = Units Sold - Units Returned.
3. Find which platform–location pair has the lowest average discount.
4. Determine the product-category pairs that appear in all locations.


#1
select Platform, `Product Name`, sum(`Units Returned`) as units_returned from practicedb.product 
group by Platform, `Product Name` 
order by Platform, units_returned desc
limit 5 by Platform



#2
select category,  (sum(`Units Sold`) - sum(`Units Returned`)) as net_sale from practicedb.product  
group by category


#3
select Platform, location, avg(discount) as avg_discount from practicedb.product  
group by Platform, location 
order by Platform, avg_discount
limit 1 by Platform


#4 
select distinct category, `Product Name` from practicedb.product  where location in   
(select distinct location from practicedb.product)















