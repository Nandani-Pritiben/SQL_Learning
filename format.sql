--format
/* fromat(value,format_style,[,culture])
example - FORMAT(OrderDate,'dd/MM/YYYY') culture is optional
if you donot give any culture then default culture='en-us'
FORMAT(OrderDate,'dd/MM/YYYY','ja-JP'),
FORMAT(1234.56,'D','fr-FR')
*/

select
OrderDate,
FORMAT(OrderDate,'dd') day,
FORMAT(OrderDate,'ddd') weekday_abriviation,
FORMAT(OrderDate,'dddd') weekday,
FORMAT(OrderDate,'MM') month_no,
FORMAT(OrderDate,'MMM') month_abriviation,
FORMAT(OrderDate,'MMMM') month
from Sales.Orders

-- show CreationTime in this format 
--"Day wed Jan Q1 2025 12:34:56 PM"
select 
'Day '+FORMAT(CreationTime,'ddd MMM')+' Q'+
DATENAME(QUARTER,CreationTime)+
FORMAT(CreationTime,' yyyy hh:mm:ss tt')
as Format_CreationTime
from Sales.Orders;