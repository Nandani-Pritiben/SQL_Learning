-- CAST - convert specific data type
/*
CAST(value as data_type)
Example - CAST('123' AS INT)
CAST('2025--8-08' AS DATE)
no format specify
*/
SELECT
CAST('123' AS INT) AS [String to Integer],
CAST(123 AS VARCHAR) AS [Integer to varchar],
CAST('2025-08-08' AS datetime2),
CAST('2025-08-08' AS datetime)
/*     casting          formating
cast   any type to any - no formating
convert any type to any - formats only date and time
format  any type to string - format numbers and datetime 
*/