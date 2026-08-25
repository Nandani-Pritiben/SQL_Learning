-- IsDate() - check if a value is a date-Returns1 if the
-- string value is a valid date
/*
IsDate() - Syntex- IsDate(value), IsDate('2025-08-08'),IsDate(2025)
*/
select 
ISDATE('2026-08-25'),
IsDate(2025)

--
select
OrderDate,
ISDATE(OrderDate) as datecheck,
CASE When ISDATE(OrderDate) =1 Then CAST(OrderDate AS date)
ELSE '9999-09-01'
END NewOrderDate
From
(
select '2025-08' AS OrderDate UNION
select '2025-08-21' UNION
select '2025-08-22' UNION
select '2025-08-23'
)t
--where ISDATE(OrderDate) =0