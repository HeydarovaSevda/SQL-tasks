create database exercise3

create table salesman (
salesman_id int primary key,
name varchar(30) not null,
city varchar(30) ,
comission float not null)

create table customer(
customer_id int primary key,
customer_name varchar(30) not null,
city varchar(30),
grade int not null,
salesman_id int )

create table orders(
order_no int primary key,
purch_amt float not null,
order_date date,
customer_id int,
salesman_id int)

ALTER TABLE customer
ADD FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id);
ALTER TABLE orders
ADD FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id);
ALTER TABLE orders
ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

insert into salesman values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Hen',null,0.12),
(5007,'Paul Adam','Rome',0.13)

insert into customer values
(3002,'Nick Rimando','New york',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guran','London',400,null),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New york',200,5001),
(3009,'Geoff Camero','Berlin',100,null),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moncow',200,5007)

insert into orders values
(70001,150.5,'2016-10-05',3005,5002),
(70009,270.65,'2016-09-10',3001,null),
(70002,65.26,'2016-10-05',3002,5001),
(70004,110.5,'2016-08-17',3009,null),
(70007,948.5,'2016-09-10',3005,5002),
(70005,2400.6,'2016-07-27',3007,5001),
(70008,5760,'2016-09-10',3002,5001),
(70010,1983.43,'2016-10-10',3004,5006),
(70003,2480.4,'2016-10-10',3009,null),
(70012,250.45,'2016-06-27',3008,5002),
(70011,75.29,'2016-08-17',3003,5007)

create table nobel_win (
year int not null,
subject varchar(30) not null,
winner varchar(30) not null,
country varchar(30) not null,
category varchar(30) not null)

insert into nobel_win values
(1970,'Physics','Hannes Alfven','Sweden','Scientist'),
(1970,'Physics','Louis Neel','France','Scientist'),
(1970,'Chemistry','Luis Federico Leloir','France ','Scientist'),
(1970,'Physiology','Ulf von Euler','Sweden','Scientist'),
(1970,'Physiology','Bernard Katz','Germany','Scientist'),
(1970,'Literature','Aleksandr Solzhenitsyn','Russia','Linguist'),
(1970,'Economics','Paul Samuelson','USA','Economist'),
(1970,'Physiology','Julius Axelrod','USA ','Scientist'),
(1971,'Physics','Dennis Gabor','Hungary','Scientist'),
(1971,'Chemistry','Gerhard Herzberg ','Germany','Scientist'),
(1971,'Peace','Willy Brandt','Germany','Chancellor'),
(1971,'Literature','Pablo Neruda','Chile','Linguist'),
(1971,'Economics','Simon Kuznets','Russia ','Economist'),
(1978,'Peace','Anwar al-Sadat','Egypt ','President'),
(1978,'Peace','Menachem Begin','Israel','Prime Minister'),
(1987,'Chemistry','Donald J. Cram','USA ','Scientist'),
(1987,'Chemistry','Jean-Marie Lehn ','France','Scientist'),
(1987,'Physiology','Susumu Tonegawa','Japan','Scientist'),
(1994,'Economics','Reinhard Selten','Germany','Economist'),
(1994,'Peace','Yitzhak Rabin','Israel','Prime Minister'),
(1987,'Physics','Johannes Georg Bednorz','Germany','Scientist'),
(1987,'Literature','Joseph Brodsky','Russia','Linguist'),
(1987,'Economics','Robert Slow','USA','Economist'),
(1994,'Literature','Kenzaburo Oe','Japan','Linguist')

create table employee(
EMP_IDNO int primary key,
EMP_FNAME varchar(30) not null,
EMP_LNAME varchar(30) not null,
EMP_DEPT int not null)


insert into employee values
(127323,'Michale','Robbin',57),
(526689,'Carlos','Snares',63),
(843795,'Enric','Dosio',57),
(328717,'Jhon','Snares',63),
(444527,'Joseph','Dosni',47),
(659831,'Zanifer','Emily',47),
(847674,'Kuleswar','Sitaraman',57),
(748681,'Henrey ','Gabriel',47),
(555935,'Alex','Manuel',57),
(539569,'George','Mardy',27),
(733843,'Mario','Saule',63),
(631548,'Alan','Snappy',27),
(839139,'Maria','Foster',57)

--1st question
/*
Write a SQL query to locate the details of customers with grade values above 
100.
*/
select * from customer where grade>100

--2nd question
/*
Write a SQL query to find all the customers in ‘New York’ city who have a 
grade value above 100.
*/
select customer_name  from customer where city='New York' and grade>100 

--3rd question
/*
Write a SQL query to find customers who are from the city of New York or 
have a grade of over 100.*/
select customer_name  from customer where city='New York' or grade>100 

--4th question
/*
Write a SQL query to find customers who are either from the city 'New York' or 
who do not have a grade greater than 100.
*/
select customer_name  from customer where city='New York' or grade<=100

--5th question
/*
Write a SQL query to identify customers who do not belong to the city of 'New 
York' or have a grade value that exceeds 100.
*/
select *  from customer where city!='New York' or grade>100

--6th question
/*
Write a SQL query to find details of all orders excluding those with ord_date 
equal to '2016-09-10' and salesman_id higher than 5005 or purch_amt greater than 
1000.
*/
select * from orders where (not order_date= '2016-09-10' and not salesman_id>5005) or not(purch_amt>1000)

--7th question
/*
Write a SQL query to find details of all orders with a purchase amount less than 
200 or exclude orders with an order date greater than or equal to '2016-02-10' and a 
customer ID less than 3009.*/
select * from orders where purch_amt<200 or (not order_date>='2016-02-10' and not customer_id<3009)

--8th question
/*
Write a SQL query to find all orders that meet the following conditions. Exclude 
combinations of order date equal to '2016-08-17' or customer ID greater than 3005 
and purchase amount less than 1000.*/
select * from orders where (order_date<>'2016-08-17' or customer_id<=3005) and  purch_amt>=1000

--9th question
/*
Write a SQL query that displays order number, purchase amount, and the 
achieved and unachieved percentage (%) for those orders that exceed 50% of the 
target value of 6000.
*/
select order_no,purch_amt, purch_amt/60 as achived, 100-(purch_amt/60) as unachived  
from orders where purch_amt>(6000*50)/100
select * from orders

--10th question
/*
Write a SQL query to find the details of all employees whose last name is 
‘Dosni’ or ‘Mardy’.
*/
select * from employee where EMP_LNAME='Dosni' or EMP_LNAME='mardy'

--11th question
/*
Write a SQL query to find the employees who work at depart 47 or 63.
*/
select EMP_FNAME,EMP_LNAME from employee where emp_dept=47 or EMP_DEPT=63


