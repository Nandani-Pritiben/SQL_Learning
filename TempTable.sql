--TempTable - 
SELECT 
* 
INTO SalesDB.Sales.#OrderTest
from SalesDB.Sales.Orders

Select * from #orderTest
---DELETE DATA
DELETE #orderTest Where OrderStatus='Delivered'
-- Tranfer temp db to ctas actual table
SELECT
*
INTO SalesDB.Sales.Ordertest
From #OrderTest
--
Select * from SalesDB.Sales.Ordertest