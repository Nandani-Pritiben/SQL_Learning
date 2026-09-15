-- Sub_Query-Query inside another query
--1 Result Types== 1 Scalar sub query - it returns only single value
--Example
Select
AVG(Sales) AverageSale
from SalesDB.Sales.Orders
-- 2 Row Query - multiple row and Single Query Example--
SELECT
CustomerID
From SalesDB.Sales.Orders
-- 3. Table Query- it returns multiple rows and multiple columns Example
select
*
from SalesDB.Sales.Customers
-- 1. from SubQuery Temparary table of main subquery

-- Find the product of that have price higher then aerage price of all products
select
*
from(
select
ProductID,
Price,
AVG(price) over() avgPrice
from SalesDB.Sales.Products)t
where Price>avgPrice

-- Select in from subQuery type- in select only scalar subQuery allow
--main Query
	Select
	ProductID,
	Price,
	--subQuery
	(select count(*) ProductID from SalesDB.Sales.Products) as TotalProduct  
	FROM SalesDB.Sales.Products
--joining subquery - join table before join other table first filtering or
-- aggregrating data before join other table
select
*
from SalesDB.Sales.Customers as c
left join (
select
--OrderID,
CustomerID,
COUNT(*) OrderID
from SalesDB.Sales.Orders
Group by CustomerID
)t
on c.CustomerID=t.CustomerID

---where subQuery - used for complex filtering logic
-- and makes query flexible and dynamic.
-- where have scalar subquery
-- in/not in oprator
-- Find the products that have price higher then average price of all products
select
ProductID,
Price
from SalesDB.Sales.Products
where Price>(
select

AVG(Price) Averageprice
from SalesDB.Sales.Products)

-- IN/ not in Operator-- check wheather a value matches any value from the list

-- show the details pf order made by customers in germany
select 
*
from SalesDB.Sales.Orders
where CustomerID in (
select 
CustomerID
from SalesDB.Sales.Customers
where country='germany')

-- check any/all operator- atleast one match

-- example- find the female employees whose salaries are greater then any male employee

select 
*
from SalesDB.Sales.Employees where Gender='F' AND Salary >
--ANY 
--/ 
ALL (
select
Salary
from SalesDB.Sales.Employees
where Gender='M')