-- oder,product,customer detail -- security
CREATE VIEW V_order_detail_EU AS (
select
c.CustomerID,
c.FirstName,
o.OrderID,
p.Product
from Sales.Customers c
INNER JOIN Sales.Orders o
on c.CustomerID=o.CustomerID
Inner JOIN Sales.Products p
on o.ProductID=p.ProductID
where c.Country!='USA' 
)