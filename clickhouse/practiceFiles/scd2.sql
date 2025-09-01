'SCD types'

 Type 1 (Overwrite)
 Type 2 (Row Versioning)
 Type 3 (Add New Column)
 Type 6 (Hybrid)
 
 
 'Type 2: history of data changes in a table can be tracked by creating a new record for every change, 
rather than overwriting the existing record.'
 

Table Structure: (main)
Columns including natural key, surrogate key, other attributes, start_date, end_date, is_current

start_date: The timestamp indicating when a particular version of the dimension record became active.

end_date: The timestamp indicating when a particular version of the dimension record became inactive 
          (superseded by a new version). 
      For the currently active record, this is typically set to a far-future date (e.g., '9999-12-31') or NULL.

           
is_current: 1 for active, 0 for historical.      


Staging Table: A temporary table to load new or changed data from the source before processing.  


      
working: [I]
1) Insert all initial dimension records with start_date set to the load time, end_date to a far-future date,
and is_current to 1
2) When a change occurs for an existing dimension record (identified by natural key)
   i)  Deactivate Old Record: Update the end_date of the currently active record for that natural_key
                     to the current timestamp and set is_current to 0. 
   ii) Insert New Record: Insert a new record with the updated col attributes, a new surrogate_key, 
                          start_date set to the current timestamp, end_date to a far-future date, 
                          and is_current to 1.   
      
      
                          
working: [II]    
     
Detect Changes - core logic:
Identify:
1) New Records: Records present in the staging table but not in the main table.
2) Updated Records: Records where the natural key exists in both the staging and main table,
                    but one or more tracked attributes have changed.      
      
      
3) For updated records: perform 2 actions:
   GO TO (2) of working[I]
4) For new records, simply insert them into main with is_current set to 1, 
   start_date as the current date, and end_date as NULL.   
      
      
 Updation syntax:     
ALTER TABLE main_table update is_current = 0, end_date = today()
where natural_key in (select natural_key from staging_table where <change_detection_condition>) 
and is_current = 1;     
      
      
      
      
      
      
      
      
      
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 