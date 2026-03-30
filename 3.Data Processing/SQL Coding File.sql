---This is just to check if the table is loaded correctly and I am able to read it properly
select * 
from `workspace`.`default`.`brightcoffeeshopcasestudy` 
limit 100;

-----------------------------------------------------------------------
---1.Checking the date range
-----------------------------------------------------------------------
---They started collecting the data on 01 Jan 2023
SELECT MIN(transaction_date) start_date
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;

---When was the last did they collect the data 30 June 2023
SELECT MAX(transaction_date) latest_date
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;

------------------------------------------------------------------------
--2.Checking the names of store locations
------------------------------------------------------------------------
--We have 3 store locations Lower Manhattan, Hell's Kitchen, Astoria
SELECT DISTINCT store_location
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;

------------------------------------------------------------------------
---3.Checking products sold across all stores(categorical)
----------------------------------------------------------------------
SELECT DISTINCT product_category
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;

SELECT DISTINCT product_detail
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;

SELECT DISTINCT product_detail AS product_name,
                product_category AS category
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;

SELECT DISTINCT product_type
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;

SELECT DISTINCT product_category AS category,
                product_type,
                product_detail AS product_name
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;

----------------------------------------------------------------
---1.Checking product prices
----------------------------------------------------------------

SELECT MIN(unit_price) AS cheapest_price
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;


SELECT MAX(unit_price) AS expensive_price
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;
----------------------------------------------------------------
---Counting Number of rows, Number of Sale, Number of Product, Number of stores With COUNT() of ID'S
-----------------------------------------------------------------
SELECT COUNT(*) AS number_of_rows,
       COUNT(DISTINCT transaction_id) AS number_of_sale,
       COUNT(DISTINCT product_id) AS number_of_products,
       COUNT(DISTINCT store_id) AS number_of_stores
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;

SELECT COUNT(*)
FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;
----------------------------------------------------------------
----Transaction Dates
---------------------------------------------------------------
SELECT  transaction_id,
        transaction_date,
        DAYNAME(transaction_date) AS Day_name,
        Monthname(transaction_date) AS Month_name,
        transaction_qty*unit_price AS revenue_per_tnx
        FROM `workspace`.`default`.`brightcoffeeshopcasestudy`;
-------------------------------------------------------------
--I aggregate the revenue per day 
---------------------------------------------------------------
SELECT 
--------Dates
        transaction_date AS purchase_date,
        DAYNAME(transaction_date) AS Day_name,
        Monthname(transaction_date) AS Month_name,
        Dayofmonth(transaction_date) AS day_of_month,
        


        CASE
              WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'Weekend'
              ELSE 'Weekday'
              END AS day_classification,



        ---date_format(transaction_time, 'HH:mm:ss') AS purchase_time,

            Case
            When date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01.Morning'
            When date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02.Afternoon'
             When date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
             END AS time_buckets,
             
          
        

--------Revenue
        
        SUM(transaction_qty*unit_price) AS revenue_per_day,

CASE 
        WHEN revenue_per_day <=50 THEN '01.Low Spend'
        WHEN revenue_per_day BETWEEN 51 AND 100 THEN '02. Med Spend'
        ELSE '03. High Spend'
END AS  spend_bucket,


-----Counts of IDS
     COUNT(DISTINCT transaction_id) AS Number_of_sales,
     COUNT(DISTINCT product_id) AS number_of_products,
     COUNT(DISTINCT store_id) AS number_of_stores,
        
-------Categorical columns
        store_location,
        product_category,
        product_detail

FROM `workspace`.`default`.`brightcoffeeshopcasestudy`
GROUP BY 
        transaction_date,
        DAYNAME(transaction_date),
        Monthname(transaction_date),
        Dayofmonth(transaction_date),
        CASE
              WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'Weekend'
              ELSE 'Weekday'
              END,
        Case
            When date_format(transaction_time, 'HH:mm:ss') BETWEEN '00:00:00' AND '11:59:59' THEN '01.Morning'
            When date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '16:59:59' THEN '02.Afternoon'
             When date_format(transaction_time, 'HH:mm:ss') >= '17:00:00' THEN '03. Evening'
             END,


        store_location,
        product_category,
        product_detail;

------------------------------------------------------------------------------    
