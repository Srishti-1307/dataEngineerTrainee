Star Schema: is a fundamental data modeling approach
Data modeling: is the process of creating a visual representation of data structures and
their relationships, essentially acting as a blueprint for how data is organized and stored within a system


Fact Table: stores quantitative data, also known as "measures" such as sales amounts, revenue, quantities sold, 
           It contains foreign keys that link to the primary keys of the associated dimension tables.
           
           
Dimension Tables: These tables surround the fact table and provide descriptive attributes 
                  that give context to the measures in the fact table.
                  Examples include customer details (name, address), product information (product ID, category), 
                  time periods (date, month, year), or location details (city, state).
                  Each dimension table typically contains a primary key that is referenced by the fact table.
                  
                  
IMPLEMENTATION

create database stars  


'Fact Table'
create table stars.sales_fact(
sales_id UUID,
product_id UUID,
customer_id UUID,
date_id UUID,
store_id UUID,
quantity float,
amount_sold float,
discount decimal
)
engine = MergeTree()
order by sales_id
Primary key sales_id

------------------------------------------------------------


'Dimension Tables'

create table stars.customer(
customer_id varchar,
name String,
address varchar,
city String,
age int,
gender LowCardinality(String)
)
Primary Key customer_id


------------------------------------------------------------


create table stars.product(
product_id varchar,
name String,
category LowCardinality(String),
brand String,
unit_sold float,
)
Primary key product_id


------------------------------------------------------------


create table stars.store(
store_id varchar,
owner String,
store_location String,
store_type String
)
Primary key store_id


------------------------------------------------------------


create table stars.time_dim(
date_id varchar,
date date,
quarter tinyint
)
primary key date_id



--------------------------------------------------------------------------------------------------------------------------


'insertion through csv'


create table students_placement(
College_ID	varchar,
IQ	int,
Prev_Sem_Result	float,
CGPA float,	
Academic_Performance int,	
Internship_Experience LowCardinality(String),
Extra_Curricular_Score int,	
Communication_Skills int,	
Projects_Completed	int,
Placement LowCardinality(String)
)
order by College_ID



select * from students_placement

'In terminal run below command: '
'clickhouse-client --user=Srishti --password='Srishti@13' 
--query="INSERT INTO default.students_placement FORMAT CSVWithNames" 
< /home/developer/Desktop/clickhouse-setup/students_placement.csv'


truncate table students_placement


-----------------------------------------------------------------------------------------------------------------------



create table demo(id int, name String, age int)
order by id

'inserting values programatically; I have a insert.py file'
'
import clickhouse_connect as c
client = c.get_client(host='localhost', port=8123, username='Srishti', password='Srishti@13')

#list of list or list of tuple 
data_to_insert = [
    (1, 'Alice', 30),
    (2, 'Bob', 25),
    (3, 'Charlie', 35)
]

client.insert('demo', data_to_insert, column_names=['id', 'name', 'age'])

print("Data inserted successfully.")
client.close()
'

select * from demo

-----------------------------------------------------------------------------------------------------------------------





