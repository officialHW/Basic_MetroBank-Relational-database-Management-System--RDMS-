-- the task 1 
-- my first step is to Create statement

--Create all the tables in our Database (customer, tyransactions table, employee , account, loan, and branches)

--starting with the Customer Table
create table customers(
	customerid int primary key,
	FirstName varchar(255),
	LastName varchar(255),
	DateofBirth date,
	Address text,
	PhoneNumber varchar(20),
	City varchar(255)
);

--next we create the Account Table
create table Account(
	accountNumber int primary key,
	customerid int,
	accountType varchar(20),
	balance decimal(15,2),
	dateopened date,
	foreign key(customerid) references customers(customerid)
);

--Next is the branch Table
create table Branches(
	BranchId int primary key,
	Branchname varchar(255),
	Branchaddress text,
	BranchPhoneNumber varchar(20)
);

--Next is the transactions table
create table Transactions(
	trasactionid int primary key,
	accountNumber int,
	transactiontype varchar(255),
	amount decimal(15,2),
	transactiondate date,
	foreign key(accountNumber) references Account(accountNumber)
);

-- Next is the Employee Table
create table Employees(
	employeeid int primary key,
	name varchar(255),
	position varchar(255),
	branchid int,
	Hiredate date,
	foreign key(branchid) references branches(branchid)
);

--Next is the loan table
create table loan(
	loanid int primary key,
	customerid int,
	loanamount decimal(15,2),
	loantype varchar(255),
	issuedate date,
	interestrate decimal(3,2),
	foreign key(customerid) references customers(customerid)
);

--Task 2 - Alter Statement
--Question 1; adding email to the customers table without deleting
alter table customers add email varchar(255);

--Question 2; how would you alter loan table to change the data type of interest rate from decimal to float?
alter table loan alter column interestrate type float;

--Question 3; metrobank needs to ensure phone number in customer table is unique write another command to add this constraint
--we want to ensure no customer is using the same number
alter table customers add unique(PhoneNumber);

--Question 4; Metrobank wants to track the branch where each account was opened. How would you alter the "Accounts" table to include a new field named 'BranchID' that references the 'Branches' table?
--we want to add branchid to accounts table
alter table Account ADD column BranchId int,
alter table Account add constraint fk_BranchId foreign key (BranchId) references Branches(BranchId)
;

--DROP STATEMENT
-- lets drop our tables and create it again, start afresh
drop table employees;

drop table transactions;

drop table account;

drop table branches;

drop table customers;

alter table loan drop constraint loan_customerid_fkey;

drop table customers;

drop table loan;

--Now lets recreate the table
create table customers(
	customerid int primary key,
	FirstName varchar(255),
	LastName varchar(255),
	DateofBirth date,
	Address text,
	PhoneNumber varchar(20),
	City varchar(255)
);

--next we create the Account Table
create table Account(
	accountNumber int primary key,
	customerid int,
	accountType varchar(20),
	balance decimal(15,2),
	dateopened date,
	foreign key(customerid) references customers(customerid)
);

--Next is the branch Table
create table Branches(
	BranchId int primary key,
	Branchname varchar(255),
	Branchaddress text,
	BranchPhoneNumber varchar(20)
);

--Next is the transactions table
create table Transactions(
	transactionid int primary key,
	accountNumber int,
	transactiontype varchar(255),
	amount decimal(15,2),
	transactiondate date,
	foreign key(accountNumber) references Account(accountNumber)
);

-- Next is the Employee Table
create table Employees(
	employeeid int primary key,
	name varchar(255),
	position varchar(255),
	branchid int,
	Hiredate date,
	foreign key(branchid) references branches(branchid)
);

--Next is the loan table
create table loan(
	loanid int primary key,
	customerid int,
	loanamount decimal(15,2),
	loantype varchar(255),
	issuedate date,
	interestrate decimal(3,2),
	foreign key(customerid) references customers(customerid)
);



--bearing in mind that we already have the csv file for this tables, now we want to bring the csv into our database for their respective table or entity
--instead of writing the insert one after the other, write click on the table and you will see import/export, if you have a header on your table, always turn on the header when importing
