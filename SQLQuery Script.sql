/*Our purpose here in the SQL Server is to build a query to combine the tables 
to further use it in the Power BI to build a dashboard*/

/* We will take a look into all the five tables at first to have an idea about 
the tables*/

SELECT *
FROM   [Projects].[dbo].['2018$'] 
SELECT *
FROM   [Projects].[dbo].['2019$'] 
SELECT *
FROM   [Projects].[dbo].['2020$'] 
SELECT *
FROM   [Projects].[dbo].[meal_cost$]
SELECT *
FROM   [Projects].[dbo].[market_segment$] 

/*Initially, we will Join the tables for 3 years. This combined table contains 
a little more than one hundred thousand rows.*/

SELECT *
FROM   [Projects].[dbo].['2018$']
UNION
SELECT *
FROM   [Projects].[dbo].['2019$']
UNION
SELECT *
FROM   [Projects].[dbo].['2020$'] 

/*Now we will modify the query by using Common Table Expression to give it a 
proper format*/

WITH hotels
     AS (SELECT *
         FROM   [Projects].[dbo].['2018$']
         UNION
         SELECT *
         FROM   [Projects].[dbo].['2019$']
         UNION
         SELECT *
         FROM   [Projects].[dbo].['2020$'])
SELECT *
FROM   hotels 

/*So, this is our primary table. Next we will make two LEFT JOINS to 
add meal_cost and market_segment with the previous query*/

WITH hotels
     AS (SELECT *
         FROM   [Projects].[dbo].['2018$']
         UNION
         SELECT *
         FROM   [Projects].[dbo].['2019$']
         UNION
         SELECT *
         FROM   [Projects].[dbo].['2020$'])
SELECT *
FROM   hotels
       LEFT JOIN [Projects].[dbo].[market_segment$] AS MS
              ON MS.market_segment = hotels.market_segment
       LEFT JOIN [Projects].[dbo].[meal_cost$] AS MC
              ON MC.meal = hotels.meal 


/*Finally, we have created our sql query and this query combines data 
from five tables. It has 100,756 rows*/