--Use exercise database to answer these questions.


--1st question
/*
SQL statement to generate a report with customer name, city, order number, order date, order 
amount, salesperson name, and commission to determine if any of the existing customers have 
not placed orders or if they have placed orders through their salesman or by themselves.
*/
select c.customer_name, c.city, o.order_no,o.order_date,o.purch_amt, s.name,s.comission
from customer c left join orders o on c.customer_id=o.customer_id left join salesman s 
on s.salesman_id= o.salesman_id

--2nd question
/*
Write a SQL statement to generate a list in ascending order of salespersons who work either 
for one or more customers or have not yet joined any of the customers.
*/
select s.name, count(c.customer_id) from customer c right join  salesman s
on c.salesman_id= s.salesman_id  group by s.name order by count(c.customer_id)

--3rd question
/*
Write a SQL query to list all salespersons along with customer name, city, grade, order
number, date, and amount. 
*/
select s.name, c.customer_name, c.city,c.grade, o.order_no, o.order_date, o.purch_amt
from salesman s left join orders o on s.salesman_id=o.salesman_id  left join customer c
on c.customer_id=o.customer_id

--4th question 
/*
Write a SQL statement to make a list for the salesmen who either work for one or more 
customers or yet to join any of the customer. The customer may have placed, either one or more 
orders on or above order amount 2000 and must have a grade, or he may not have placed any 
order to the associated supplier.
*/
select s.name, c.customer_name, o.order_no, o.purch_amt,c.grade from salesman s left join customer c
on s.salesman_id=c.salesman_id left join orders o on c.customer_id=o.customer_id
where o.purch_amt >=2000 and c.grade is not null

--5th question
/*
For those customers from the existing list who put one or more orders, or which orders have 
been placed by the customer who is not on the list, create a report containing the customer name, 
city, order number, order date, and purchase amount.
*/
select customer_name,c.city, o.order_no, o.order_date, o.purch_amt from customer c left join
orders o on c.customer_id=o.customer_id 

--6th question
/*
Write a SQL statement to generate a report with the customer name, city, order no, order date, 
purchase amount for only those customers on the list who must have a grade and placed one or 
more orders or which order(s) have been placed by the customer who neither is on the list nor 
has a grade.
*/
select customer_name,c.city,o.order_no ,o.order_date, o.purch_amt  from customer c full join
orders o on c.customer_id=o.customer_id

--7th question
/*
Write a SQL query to combine each row of the salesman table with each row of the customer 
table.
*/
select * from salesman s cross join customer c 

--8th question
/*
Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. 
each salesperson will appear for all customers and vice versa for that salesperson who belongs to 
that city.
*/
select name,customer_name from customer c cross join salesman s 
where c.city=s.city

--9th question
/*
Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. 
each salesperson will appear for every customer and vice versa for those salesmen who belong to 
a city and customers who require a grade.
*/
select name,customer_name from customer c cross join salesman s 
where c.city=s.city and c.grade is not null

--10th question
/*
Write a SQL statement to make a Cartesian product between salesman and customer i.e. each 
salesman will appear for all customers and vice versa for those salesmen who must belong to a 
city which is not the same as his customer and the customers should have their own grade.
*/
select name, customer_name from customer c cross join salesman s
where c.city!=s.city and c.grade is not null




