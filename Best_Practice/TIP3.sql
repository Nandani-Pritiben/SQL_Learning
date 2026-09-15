-- TIP 3 - For Exploration Purpose Use Limit of Rows

-- Bad Practice --
SELECT
FIRSTNAME
From SalesDB.Sales.Customers

--- Good Practice --
Select TOP 5
FirstName
From SalesDB.Sales.Customers 