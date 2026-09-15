-- oder,product,customer detail
CREATE VIEW V_order_detail AS (
select
c.CustomerID,
c.FirstName,
o.OrderID,
p.Product
from Sales.Customers c
INNER JOIN Sales.Orders o
on c.CustomerID=o.CustomerID
Inner JOIN Sales.Products p
on o.ProductID=p.ProductID)