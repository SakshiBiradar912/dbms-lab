create table Account(Account_No int(5) Primary key,Branch_Name Varchar(10),Balance
int(7) );

create table Branch(Branch_Name Varchar(10) Primary key ,Branch_city
varchar(10),Assests int (6));

create table Costumer(Cust_Name Varchar(15) primary key,Cust_street
varchar(10),Cust_City varchar(20));

create table Depositor(Cust_Name varchar(15),Account_No int(5));

create table Loan(Loan_No int(10) primary key,Branch_Name varchar(10),Amount
int(10));

create table Borrower(Cust_Name varchar(15),Loan_No int(10));

alter table Account add foreign key(Branch_Name) References Branch(Branch_Name);

alter table Depositor add foreign key(Cust_Name) References Costumer(Cust_Name);

alter table Depositor add foreign key(Account_No) References Account(Account_No);

alter table Loan add foreign key(Branch_Name) References Branch(Branch_Name);

alter table Borrower add foreign key(Cust_Name) References Costumer(Cust_Name);

alter table Borrower add foreign key(Loan_No) References Loan(Loan_No);

insert into Branch values('Camp','Pune',4),('Akurdi','Pune',6),('Nigdi','Pune',5),
('Dehu','Pune',3),('Wakad', 'Pune', 580000),('Kharadi', 'Pune', 630000),('Magarpatta', 'Pune',
520000),('VimanNr', 'Pune', 480000),('Kothrud', 'Pune', 550000);

insert into Costumer values('Harsh','Street1','Pune'),('Bhushan','Street2','Pune'),
('Kapil','Street3','Pune'),('Rohan','Street4','Pune'),('Loki Laufeyson', 'OrangeSt', 'Pune'),('Thoron',
'Street5', 'Pune'),('Rahul', 'Street6', 'Pune'),('Wandan', 'Street7', 'Pune'),('Pawan', 'Street8', 'Pune');

insert into Account values(120,'Camp',1234),(121,'Akurdi',34567),(122,'Nigdi',12001),
(123,'Dehu',50012),(124, 'Wakad', 30000),(125, 'Kharadi', 27000),(126, 'Magarpatta', 23000),(127,
'VimanNr', 28000),(128, 'Kothrud', 26000);

insert into Depositor values('Harsh',120),('Bhushan',121),('Kapil',122),('Rohan',123),('Loki
Laufeyson',124),('Thoron',125),('Rahul',126),('Wandan',127),('Pawan',128);

insert into Loan values(1,'Camp',12345),(2,'Akurdi',3400),(3,'Nigdi',20000),
(4,'Dehu',2000);

insert into Borrower values('Harsh',1),('Bhushan',2),('Kapil',3),('Rohan',4);

select branch_name from Loan;

+-------------+
| branch_name |
+-------------+
| Akurdi      |
| Camp        |
| Dehu        |
| Nigdi       |
+-------------+
4 rows in set (0.00 sec)

select Loan_No from Loan where Branch_Name='Akurdi' and Amount>1000;

+---------+
| Loan_No |
+---------+
| 2       |
+---------+
1 row in set (0.00 sec)

select * from Loan;

+---------+-------------+--------+
| Loan_No | Branch_Name | Amount |
+---------+-------------+--------+
| 1       | Camp        | 12345  |
| 2       | Akurdi      | 3400   |
| 3       | Nigdi       | 20000  |
| 4       | Dehu        | 2000   |
+---------+-------------+--------+
4 rows in set (0.00 sec)
mysql> select Costumer.Cust_Name, Loan.Loan_No,Amount from Costumer,Loan,Borrower where
Costumer.Cust_Name=Borrower.Cust_Name and Loan.Loan_No=Borrower.Loan_No;

+-----------+---------+--------+
| Cust_Name | Loan_No | Amount |
+-----------+---------+--------+
| Harsh     | 1       | 12345  |
| Bhushan   | 2       | 3400   |
| Kapil     | 3       | 20000  |
| Rohan     | 4       | 2000   |
+-----------+---------+--------+
4 rows in set (0.00 sec)
mysql> select Costumer.Cust_Name from Costumer;
--------------
select Costumer.Cust_Name from Costumer
--------------
+----------------+
| Cust_Name      |
+----------------+
| Bhushan        |
| Harsh          |
| Kapil          |
| Loki Laufeyson |
| Pawan          |
| Rahul          |
| Rohan          |
| Thoron         |
| Wandan         |
+----------------+
9 rows in set (0.00 sec)
mysql> select Borrower.Cust_Name from Borrower,Loan where
Borrower.Loan_No=Loan.Loan_No;

+-----------+
| Cust_Name |
+-----------+
| Harsh     |
| Bhushan   |
| Kapil     |
| Rohan     |
+-----------+
4 rows in set (0.00 sec)
mysql> select Costumer.Cust_Name from Costumer where Costumer.Cust_Name Not in (select
Borrower.Cust_Name from Borrower);

+----------------+
| Cust_Name      |
+----------------+
| Loki Laufeyson |
| Pawan          |
| Rahul          |
| Thoron         |
| Wandan         |
+----------------+
5 rows in set (0.02 sec)
mysql> select Costumer.Cust_Name,Costumer.Cust_City from Costumer where
Costumer.Cust_Name like 'P%';

+-----------+-----------+
| Cust_Name | Cust_City |
+-----------+-----------+
| Pawan     | Pune      |
+-----------+-----------+
1 row in set (0.00 sec)

SELECT Costumer.Cust_Name, Loan.Loan_No, Loan.Amount FROM Costumer JOIN
Borrower ON Costumer.Cust_Name = Borrower.Cust_Name JOIN Loan
-> ON Borrower.Loan_No = Loan.Loan_No;

+-----------+---------+--------+
| Cust_Name | Loan_No | Amount |
+-----------+---------+--------+
| Harsh     | 1       | 12345  |
| Bhushan   | 2       | 3400   |
| Kapil     | 3       | 20000  |
| Rohan     | 4       | 2000   |
+-----------+---------+--------+
4 rows in set (0.00 sec)

mysql> SELECT Branch_name, AVG(Balance) AS avg_balance FROM Account GROUP BY
Branch_Name;

+-------------+-------------+
| Branch_name | avg_balance |
+-------------+-------------+
| Akurdi      | 34567.0000  |
| Camp        | 1234.0000   |
| Dehu        | 50012.0000  |
| Kharadi     | 27000.0000  |
| Kothrud     | 26000.0000  |
| Magarpatta  | 23000.0000  |
| Nigdi       | 12001.0000  |
| VimanNr     | 28000.0000  |
| Wakad       | 30000.0000  |
+-------------+-------------+
9 rows in set (0.00 sec)

SELECT Account.Branch_Name, COUNT(Depositor.Cust_Name) AS num_depositors
FROM Account JOIN Depositor ON Account.Account_No = Depositor.Account_No GROUP BY
Account.Branch_Name;

+-------------+----------------+
| Branch_Name | num_depositors |
+-------------+----------------+
| Akurdi      | 1              |
| Camp        | 1              |
| Dehu        | 1              |
| Kharadi     | 1              |
| Kothrud     | 1              |
| Magarpatta  | 1              |
| Nigdi       | 1              |
| VimanNr     | 1              |
| Wakad       | 1              |
+-------------+----------------+
9 rows in set (0.00 sec)

SELECT DISTINCT Branch_City FROM Branch;

+-------------+
| Branch_City |
+-------------+
| Pune |
+-------------+
1 row in set (0.00 sec)

SELECT COUNT(*) AS num_customers FROM Costumer;

+---------------+
| num_customers |
+---------------+
| 9             |
+---------------+
1 row in set (0.00 sec)

SELECT SUM(Amount) AS total_loan_amount FROM Loan;

+-------------------+
| total_loan_amount |
+-------------------+
| 37745             |
+-------------------+
1 row in set (0.00 sec)

DELETE FROM Loan WHERE Amount BETWEEN 1300 AND 1500;

select * from Loan;

+---------+-------------+--------+
| Loan_No | Branch_Name | Amount |
+---------+-------------+--------+
| 1       | Camp        | 12345  |
| 2       | Akurdi      | 3400   |
| 3       | Nigdi       | 20000  |
| 4       | Dehu        | 2000   |
+---------+-------------+--------+
4 rows in set (0.00 sec)

mysql> Delete From Account where Branch_Name IN (Select Branch_Name From Branch where
Branch_City='Nigdi');