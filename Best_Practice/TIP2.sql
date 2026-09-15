-- TIP 2- Avoid Unnecessary Use of DISTINCT and ORDER BY

-- BAD PRACTICE--
SELECT DISTINCT
FirstName
From SalesDB.Sales.Customers
Order By FirstName

-- Good Practice --
Select 
FirstName
from SalesDB.Sales.Customers