--- Tip 12 Aggregate Before joining big table 

---- Best Practice for small-medium table
-- Grouping and Joining

select c.CustomerID,c.FirstName,COUNT(o.OrderID) as OrdeCount from Sales.Customers c inner join Sales.Orders o on c.CustomerID=o.CustomerID
group by c.CustomerID,c.FirstName

-- best for big table --
-- pre aggregrate sub query
Select 
c.FirstName,c.CustomerID,o.OrderCount
from Sales.Customers c
Inner join (
select CustomerID,COUNT(orderID) as OrderCount  
from Sales.Orders GROUP BY CustomerID)o
on c.CustomerID=o.CustomerID

-- Bad Practice 
-- Corelated SubQuery

Select 
c.CustomerID,
c.FirstName,
(Select
COUNT(o.OrderID) from Sales.Orders o where 
c.CustomerID=o.CustomerID
) as OrderCount
From Sales.Customers c


-- TIP 13 -- Use UNION Instead of or in joins 

-- bad Practice --

Select
o.OrderID,
c.FirstName
from Sales.Customers c Inner Join 
Sales.orders o on c.CustomerID=o.CustomerID
or c.CustomerID=o.SalesPersonID

-- best practice --

select 
o.OrderID,
c.FirstName
from Sales.Customers c inner join Sales.Orders o on
c.CustomerID=o.CustomerID
UNION
select 
o.OrderID,
c.FirstName
from Sales.Customers c inner join Sales.Orders o on
c.CustomerID=o.SalesPersonID

--- tip 14 select nested loop
use SalesDB
select 
o.OrderID,
c.FirstName
from Sales.Customers c inner join Sales.Orders o on
c.CustomerID=o.CustomerID

-- Good practice having small and big table
use SalesDB
select 
o.OrderID,
c.FirstName
from Sales.Customers c inner join Sales.Orders o on
c.CustomerID=o.CustomerID
Option(Hash Join)

-- tip 17 s