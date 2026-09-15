-- null means unknown value -- not a zero,not a blank string,
-- not a empty space
-- ISNULL() is function Replace null with specified value

select ShipAddress,BillAddress,
ISNULL(BillAddress,ShipAddress),
ISNULL(BillAddress,'unknown')
from Sales.Orders
 -- colesce() return first non null value from the list
 select coalesce(BillAddress,ShipAddress,'n/a') from Sales.Orders

 -- give average score of customers and handle null also

 select CustomerID,Score
 ,AVG(score) over()  as averageScore,
 AVG(COALESCE(Score,0)) over() as averagescoreUsingNull
 from Sales.Customers;

 -- merging first and last name and make full and in score add 10
 select
 FirstName,
 LastName,
 COALESCE(FirstName+' '+LastName,FirstName,'No_name') AS FullName,
 Score,
 COALESCE(Score +10,0) AS SCOREADDTEN
 from Sales.Customers

 -- nullif(val1,val2) if fist val and second val
 --match then return null otherwise return null
 select
 nullif('v1','v1'),
 nullif(1,0)

 -- is null and is not null give bollean

 select
 *
 from 
 Sales.Customers
 where score is null

 select
 *
 from 
 Sales.Customers
 where score is  not null

 -- customers who have not placed orders

  select c.CustomerID,c.FirstName,c.LastName,o.OrderID 
  from Sales.Customers as c
  left join Sales.Orders as o on c.CustomerID=o.CustomerID
  where o.CustomerID is null 