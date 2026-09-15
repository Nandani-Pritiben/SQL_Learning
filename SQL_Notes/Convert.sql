-- convert - convert date or time in to 
--different datatype & fromat value
/* syntex- CONVERT(data_type,value,[,style]) here style is optional
Examples= CONVERT(INT,'124')
CONVERT(VARCHAR,OrderDate,'34')
style no, = 34
default style=0 */
Select 
CONVERT(INT,'123') AS [String to INT convert],
CONVERT(DATE,'2025-08-01') AS [String to DATE convert],
CreationTime,
CONVERT(DATE,CreationTime) AS [DATETIME to DATE CreationTime],
CONVERT(varchar,CreationTime,32) AS [DATETIME to VARCHAR USA:32],
CONVERT(varchar,CreationTime,34) AS [DATETIME to VARCHAR EURO:34]
from Sales.Orders