--Data Query Language
--select statement (* = all/everything) (allows you to view records in your database table)
--example lets take a look at the account table
select  * -- this means select everything from account
from account;

select  * -- this means select everything from customers
from customers;

select firstname, lastname, city --here we are assuming you want to select specific columns from the customers table
from customers;

select  * -- this means select everything from employees
from employees;

select name, position, hiredate --here we are assuming we want to view only the name, position, and hiredate from the employees table
from employees;