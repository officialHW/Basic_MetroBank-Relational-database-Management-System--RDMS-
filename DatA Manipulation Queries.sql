--Data Manipulation Language

--First thing we will look at is the Insert statement
-- lets start with the customer table (we want to insert records into the table)
insert into customers(customerid, firstname, lastname, dateofbirth, address, phonenumber, city, email) values
(1, 'daniel', 'chargie', '2040-01-01', '09 silekunfole street, kowonleru busstop', '98722', 'ibadan', 'chargie@10alytics.com'),
(3, 'Burnaboy', 'cityboy', '2020-06-01', 'london boy street', '0374839', 'london', 'bb@10alytics.com'),
(4, 'Wizkid', 'Davido', '2020-09-01', '45 ojuelegba street, lekki', '748987584', 'ojuelegba', 'wizdav@10alytics.com');

insert into customers(customerid, firstname, lastname, dateofbirth, address, phonenumber, city, email) values
(2, 'Brymo', 'oju', '2020-04-01', '67 iyanoworo road', '5748347565', 'lagos', 'brymo@10alytics.com');

--next is we want to insert into the Account table its records
insert into Account(accountnumber, customerid, accounttype, balance, dateopened) values
(12345556, 1, 'savings', 1500, '2022-09-14');

insert into Account(accountnumber, customerid, accounttype, balance, dateopened) values
(65748, 1, 'savings', 2500, '2022-09-14'),
(657483, 1, 'Credit', 1000, '2022-12-14'),
(093847, 1, 'Deposit', 1500, '2022-08-14');

insert into Account(accountnumber, customerid, accounttype, balance, dateopened) values
(97678, 1, 'savings', 200, '2021-09-14');

--update statemet (lets assume we want to update a record, make changes to a record)
-- question- if a customer deposits $500 into account number 5, how would you update the balance in the 'Accounts' table?
update Account 
set balance = balance + 500
where customerid = 1; --here we are sayig we want the + 500 to the customerid 1 account

--lets assume change the account type from Checking to saving for account number 1
--we want to make a change
update Account
set accounttype = 'Checking'
where customerid = 1; -- here we are specifying who the customer we want to make changes to

--Delete statement(here we want to delete record, might be a lie, customer record e.t.c)
delete
from account
where customerid = 1; --here  we are saying we want to delete the record for customer 1

--Truncate helps you remove all records at once without specifying which you want to remove
--example we want to truncate the account table
alter table transactions drop constraint transactions_accountnumber_fkey;

truncate table account;

alter table transactions add constraint accountnumber foreign key(accountnumber) references account(accountnumber);
