---- TIP 1--- 
-- SELECT only what you need--
---Example

--- Bad practice
Select * from SalesDB.Sales.Customers

---Good Practice --
select
CustomerID,
FirstName,
LastName
from SalesDB.Sales.Customers