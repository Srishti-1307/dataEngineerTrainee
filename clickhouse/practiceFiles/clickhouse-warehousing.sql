Clickhouse is 
open-source
column-oriented 
database management system

designed for Online Analytical Processing (OLAP) workloads

Specialised and optimized for fast analytical queries on large datasets.

-----------------------------------------------------------------------------------------------------------------

Data Warehouses: are central repositories of data integrated from disparate sources for visualization, bi, analytics
and reporting
Examples include Amazon Redshift, Google BigQuery, Snowflake, Clickhouse


------------------------------------------------------------------------------------------------------------------

OLAP and OLTP 
Example: consider sales data 

OLTP:
* Real time order processing:
When a customer places an order online, the OLTP system records the transaction, updates inventory,
Tracking product availability and managing stock levels and manages payment processing. 

* Point of sale :
POS systems use OLTP to record each sale, update stock levels, and manage customer info in real-time. 


OLAP:
* Sales trend analysis:
analyze historical sales data to identify seasonal trends, popular products, Customer segmentation 
(buying behaviour) and sales patterns over time. 

* Sales performance reporting:
Generating reports on sales revenue, profit margins, and other key performance indicators (KPIs) for
different regions, time periods, or product categories. 



------------------------------------------------------------------------------------------------------------------------


MergeTree engine
handles storage and retrieval of large datasets  
working principle: managing data in "parts" and merging these parts in the background.


MergeTree: for high ingest rates and large data volumes
           (general-purpose & default)
           
           
ReplicatedMergeTree: for high availability and fault tolerance through 
                     data replication across multiple servers, ensuring data consistency
                     
                     
Log Engine Family: for handling many small tables
                   usually preferred when dealing with temporary data or smaller datasets    


ReplacingMergeTree: for deduplication, versioning* and handling updates by replacing older versions of data
                    with newer ones during background merge operations.
                    Acts as a form of upsert
                    
                    {versioning: When a version column is specified during table creation, it determines 
                    which row is considered the "latest" when duplicates with the same sorting key exist.
                    The row with the highest version value is retained.
                    If no version column is specified, the latest inserted row for a given sorting key is kept.}
                   
'The asynchronous nature of deduplication means that queries may return duplicate rows if a merge has not yet occurred.
 Using OPTIMIZE FINAL or querying with FINAL can mitigate this'                    
                    
                    
                    
                    
                    
-------------------------------------------------------------------------------------------------------------------------                    
                    
                   
                   
Insertion

Data Part:  immutable, physical chunk of data on disk that stores a portion of a table ka data.
it contains compressed column data files, metadata, and index files 
background merging combines smaller, older parts into larger.


Every INSERT statement creates one or more new data parts on disk.

If the table is partitioned, ClickHouse creates a separate data part for each unique partition 
key value present in the inserted data.


Before writing to disk, the inserted rows undergo several steps:
* Sorting: The rows are sorted according to table ki defined sorting key. 
* Splitting: The sorted data is split into individual columns.
* Compression: Each column is compressed.
* Writing to Disk: The compressed column files, along with metadata 
(like indexes) are saved within a new directory that represents the data part.



since data parts are immutable, updation works as follows: 
* Instead of modifying the original part, ClickHouse creates a new data part containing the updated or deleted data. 
* the original part remains untouched for a period.
* once new part is ready, it atomically replaces the original part.
* original part is then marked as inactive and eventually removed by background cleanup processes,

----------------------------------------------------------------------------------------------------------------------


Synchronous and Asynchronous insertion 

S: application waits for the database to fully complete the write operation before proceeding to the next task.
S is efficient when immediate data consistency and integrity are paramount, such as in financial transactions 
or systems requiring strict adherence to ACID properties.

A: application does not wait for the database to complete the write operation
is efficient for high-volume, bulk data ingestion and scenarios where responsiveness and throughput 
are prioritized over immediate data consistency

----------------------------------------------------------------------------------------------------------------------






























