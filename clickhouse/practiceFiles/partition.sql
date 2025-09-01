'PARTITION BY defines how data is physically organized into logical segments (partitions) by defining a partitioning key.

PARTITION BY clause is specified in the CREATE TABLE statement. 
It takes a column or a function applied to a column (e.g., toStartOfMonth(date_column))
whose result determines the partition for each row.

working: When you define a PARTITION BY expression, ClickHouse calculates a partition ID for each row based on that expression.
All rows with the same partition ID are stored together within a single partition directory.
'



create table practicedb.bookMyShow(id int, show_time DateTime, title String, rating float, hall_no int)
engine = MergeTree()
partition by toYYYYMM(show_time)
order by id


'all entries from the same month, year will reside in the same physical partition.'


'Primary purpose of using partition by is: Data Management.'


'Dropping old data: entire partitions can be efficiently dropped. Example: to remove data older than a certain period.'
alter table practicedb.bookMyShow
drop partition '202506'


'Defining TTL rules to automatically delete a partition, after table creation.'
alter table  practicedb.bookMyShow modify TTL show_time + interval 12 Month delete



'Querying with Partition Pruning'
select count(id) from practicedb.bookMyShow where show_time > '2025-07-01'






s