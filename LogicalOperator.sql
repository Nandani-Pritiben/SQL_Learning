select * from customers where country='USA' and score>500;
-- or operator
select * from customers where country='USA' or score>500;

-- Not operator

select * from customers where not score > 500;


