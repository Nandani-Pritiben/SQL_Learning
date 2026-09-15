-- for update 3 types 
-- 1 use replace for postgres only
CREATE OR REPLACE VIEW SALES.V_sales AS (
SELECT 
SUM(Sales) AS TOTALMONTH FROM Sales.Orders
GROUP BY DATETRUNC(MONTH,OrderDate)
)
-- 2. drop and then create again if exist 
IF OBJECT_ID('Sales.V_Sales','v') IS NOT NULL
	DROP VIEW Sales.V_Sales;
GO
CREATE OR ALTER VIEW SALES.V_sales AS (
SELECT 
SUM(Sales) AS TOTALMONTH FROM Sales.Orders
GROUP BY DATETRUNC(MONTH,OrderDate)
)
