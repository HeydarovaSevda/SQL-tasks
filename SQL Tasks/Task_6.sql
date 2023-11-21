--Use exercise database to answer these questions.


--1st question
/* 
Write a SQL query to find the salesperson and customer who reside in the same city. Return 
Salesman, cust_name and city.
*/
select s.name,c.customer_name, c.city from salesman s inner join customer c
on s.city=c.city

--2nd question
/*
Write a SQL query to find those orders where the order amount exists between 500 and 2000. 
Return ord_no, purch_amt, cust_name, city.
*/
select o.order_no,o.purch_amt,c.customer_name,c.city from orders o inner join customer c
on o.customer_id=c.customer_id where o.purch_amt between 500 and 2000

--3rd question
/*
Write a SQL query to find the salesperson(s) and the customer(s) he represents. Return 
Customer Name, city, Salesman, commission.
*/
select c.customer_name,c.city, s.name,s.comission from salesman s 
inner join customer c on s.salesman_id=c.salesman_id

--4th question
/*
Write a SQL query to find salespeople who received commissions of more than 12 percent 
from the company. Return Customer Name, customer city, Salesman, commission.
*/
select c.customer_name,c.city, s.name, s.comission from salesman s inner join  customer c 
on c.salesman_id=s.salesman_id where s.comission>0.12

--5th question
/*
Write a SQL query to locate those salespeople who do not live in the same city where their 
customers live and have received a commission of more than 12% from the company. Return 
Customer Name, customer city, Salesman, salesman city, commission.
*/
select c.customer_name,c.city, s.name, s.comission from customer c
inner join salesman s on c.salesman_id=s.salesman_id where s.city<>c.city and s.comission>0.12

--6th question
/*
Write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, 
Customer Name, grade, Salesman, commission.
*/
select o.order_no,o.order_date,o.purch_amt, c.customer_name,c.grade,s.name,s.comission
from orders o inner join customer c on o.customer_id=c.customer_id inner join salesman s 
on s.salesman_id=o.salesman_id

--7th question
/*
Write a SQL statement to join the tables salesman, customer and orders so that the same 
column of each table appears and only the relational rows are returned.
*/
select c.salesman_id from salesman s inner join customer c on s.salesman_id=c.salesman_id inner join
orders o on o.salesman_id=s.salesman_id

--8th question
/*
Write a SQL query to display the customer name, customer city, grade, salesman, salesman 
city. The results should be sorted by ascending customer_id.
*/
select c.customer_name,c.city, c.grade, s.name, s.city from customer c
inner join salesman s on c.salesman_id=s.salesman_id order by c.customer_id

--9th question
/*
Write a SQL query to find those customers with a grade less than 300. Return cust_name, 
customer city, grade, Salesman, salesmancity. The result should be ordered by ascending 
customer_id.
*/
select c.customer_name,c.city, c.grade ,s.name,s.city from salesman s inner join customer c 
on s.salesman_id=c.salesman_id
where c.grade<300 order by c.customer_id 

--10th question
/*
 Write a SQL statement to make a report with customer name, city, order number, order date, 
and order amount in ascending order according to the order date to determine whether any of the 
existing customers have placed an order or not.
*/
select c.customer_name, c.city, o.order_no, o.order_date, o.purch_amt from orders o right join 
customer c on c.customer_id=o.customer_id order by o.order_date
