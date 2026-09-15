-- case stetement - evaluates all list of conditions
-- and return value when first condition are met

/* syntex
case
when condition1 then result1
when condition2 then result2
-----
Else result
End
*/
select
Category,
sum(Sales) as totalcategory
from(
select
OrderID,
Sales,
Case
when Sales>50 then 'high'
when Sales>20 then 'medium'
Else 'low'
END Category
from Sales.Orders)t
group by Category
order by totalcategory DESC