mysql> CREATE TABLE Account (
-> Acc_no INT AUTO_INCREMENT PRIMARY KEY,
-> branch_name VARCHAR(25),
-> balance INT(20)
-> );

mysql> CREATE TABLE Branch (
-> branch_name VARCHAR(25) PRIMARY KEY,
-> branch_city VARCHAR(15),
-> assets INT
-> );

mysql> CREATE TABLE Customer (
-> cust_name VARCHAR(25) PRIMARY KEY,
-> cust_street VARCHAR(25),
-> cust_city varchar(25)
-> );

mysql> CREATE TABLE Depositor (
-> cust_name VARCHAR(25),
-> Acc_no INT
-> );

mysql> CREATE TABLE Loan (
-> loan_no INT AUTO_INCREMENT PRIMARY KEY,
-> branch_name VARCHAR(25),
-> amount int
-> );

mysql> CREATE TABLE Borrower (
-> cust_name VARCHAR(25),
-> loan_no INT );

mysql> Alter table Account add foreign key (branch_name) references Branch(branch_name);

mysql> describe Branch;

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| branch_name | varchar(25) | NO   | PRI | NULL    |       |
| branch_city | varchar(15) | YES  |     | NULL    |       |
| assets      | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> Alter table Depositor add foreign key (cust_name) references Customer(cust_name);

mysql> Alter table Depositor add foreign key (Acc_no) references Account(Acc_no);

mysql> describe Depositor;

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| cust_name | varchar(25) | YES  | MUL | NULL    |       |
| Acc_no    | int(11)     | YES  | MUL | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> Alter table Loan add foreign key (branch_name) references Branch(branch_name);

mysql> describe Loan;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| loan_no     | int(11)     | NO   | PRI | NULL    | auto_increment |
| branch_name | varchar(25) | YES  | MUL | NULL    |                |
| amount      | int(11)     | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)
mysql> Alter table Borrower add foreign key (cust_name) references Customer(cust_name);
--------------
Alter table Borrower add foreign key (cust_name) references Customer(cust_name)
--------------
Query OK, 0 rows affected (0.87 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> Alter table Borrower add foreign key (loan_no) references Loan(loan_no);
--------------
Alter table Borrower add foreign key (loan_no) references Loan(loan_no)
--------------
Query OK, 0 rows affected (0.62 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> describe Borrower;
--------------
describe Borrower
--------------
+-----------+-------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| cust_name | varchar(25) | YES | MUL | NULL | |
| loan_no | int(11) | YES | MUL | NULL | |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)
mysql> INSERT INTO Branch (branch_name, branch_city, assets) VALUES
-> ('BOMBaner', 'Pune', 545000),
-> ('BOMNigdi', 'Pune', 400000),
-> ('BOMdhanori', 'Pune', 600000),
-> ('BOMandheri', 'Mumbai', 750000),
-> ('BOMjalgaon', 'jalgaon', 450000),
-> ('BOMsatara', 'satara', 550000),
-> ('BOMnagpur', 'nagpur', 480000),
-> ('BOMAkurdi', 'Pune', 520000),

-> ('BOMKharadi', 'Pune', 630000),
-> ('BOMpimpri', 'Pune', 50000);

Records: 10 Duplicates: 0 Warnings: 0
mysql>
mysql> INSERT INTO Customer (cust_name, cust_street, cust_city) VALUES
-> ('nita', 'radha chowk', 'Pune'),
-> ('sunita', 'sivraj nagar', 'Pune'),
-> ('maya', 'le park street', 'Pune'),
-> ('jaya', 'shivtirth nagar', 'Pune'),
-> ('neha', 'kalewadi road', 'Pune'),
-> ('sulekha', 'jahangir', 'Pune'),
-> ('dnyanda', 'wakad road', 'Pune'),
-> ('divya', 'vileparle road', 'mumbai'),
-> ('nitya', 'shivaji park', 'mumbai'),
-> ('ovi', 'Orange St', 'nagpur');

Records: 10 Duplicates: 0 Warnings: 0
mysql> INSERT INTO Account (Acc_no, branch_name, balance) VALUES
-> (1, 'BOMBaner', 15000),
-> (2, 'BOMNigdi', 20000),
-> (3, 'BOMAkurdi', 18000),

-> (4, 'BOMandheri', 22000),
-> (5, 'BOMjalgaon', 25000),
-> (6, 'BOMsatara', 30000),
-> (7, 'BOMnagpur', 27000),
-> (8, 'BOMAkurdi', 23000),
-> (9, 'BOMBaner', 28000),
-> (10, 'BOMpimpri', 26000);

mysql> INSERT INTO Depositor (cust_name, acc_no) VALUES
-> ('nita', 1),
-> ('sunita', 2),
-> ('maya', 3),
-> ('jaya', 4),
-> ('neha', 5),
-> ('sulekha', 6),
-> ('dnyanda', 7),
-> ('divya', 8),
-> ('nitya', 9),
-> ('ovi', 10);

mysql> INSERT INTO Loan (loan_no, branch_name, amount) VALUES
-> (501, 'BOMBaner', 15000),
-> (502, 'BOMNigdi', 25000),
-> (503, 'BOMAkurdi', 18000),
-> (504, 'BOMandheri', 22000),
-> (505, 'BOMjalgaon', 30000),
-> (506, 'BOMsatara', 27000),
-> (507, 'BOMnagpur', 23000),
-> (508, 'BOMBaner', 26000);

mysql> INSERT INTO Borrower (cust_name, loan_no) VALUES
-> ('nita', 501),
-> ('sunita', 502),
-> ('maya', 503),
-> ('jaya', 504),
-> ('neha', 505),
-> ('sulekha', 506),
-> ('dnyanda', 507),
-> ('divya', 508);

mysql> create view view1 as select cust_name from Borrower where loan_no in(select loan_no
from Loan where branch_name='BOMbaner');

mysql> select *from view1 order By cust_name asc;

+-----------+
| cust_name |
+-----------+
| divya     |
| nita      |
+-----------+
2 rows in set (0.01 sec)

mysql> create view view2 as select branch_name , branch_city from Branch ;

mysql> select *from view2;
+-------------+-------------+
| branch_name | branch_city |
+-------------+-------------+
| BOMAkurdi   | Pune        |
| BOMandheri  | Mumbai      |
| BOMBaner    | Pune        |
| BOMdhanori  | Pune        |
| BOMjalgaon  | jalgaon     |
| BOMKharadi  | Pune        |
| BOMnagpur   | nagpur      |
| BOMNigdi    | Pune        |
| BOMpimpri   | Pune        |
| BOMsatara   | satara      |
+-------------+-------------+
10 rows in set (0.00 sec)

mysql> insert into view2 values ('BOMVardha','Vardha');

mysql> select *from view2;

+-------------+-------------+
| branch_name | branch_city |
+-------------+-------------+
| BOMAkurdi   | Pune        |
| BOMandheri  | Mumbai      |
| BOMBaner    | Pune        |
| BOMdhanori  | Pune        |
| BOMjalgaon  | jalgaon     |
| BOMKharadi  | Pune        |
| BOMnagpur   | nagpur      |
| BOMNigdi    | Pune        |
| BOMpimpri   | Pune        |
| BOMsatara   | satara      |
| BOMVardha   | Vardha      |
+-------------+-------------+
11 rows in set (0.00 sec)

mysql> update view2 set branch_name='BOMkatraj',branch_city='Pune' where
branch_name='BOMVardha';

mysql> select *from view2;

+-------------+-------------+
| branch_name | branch_city |
+-------------+-------------+
| BOMAkurdi   | Pune        |
| BOMandheri  | Mumbai      |
| BOMBaner    | Pune        |
| BOMdhanori  | Pune        |
| BOMjalgaon  | jalgaon     |
| BOMkatraj   | Pune        |
| BOMKharadi  | Pune        |
| BOMnagpur   | nagpur      |
| BOMNigdi    | Pune        |
| BOMpimpri   | Pune        |
| BOMsatara   | satara      |
+-------------+-------------+
11 rows in set (0.00 sec)
mysql> delete from view2 where branch_name='BOMkatraj';

mysql> select *from view2;
+-------------+-------------+
| branch_name | branch_city |
+-------------+-------------+
| BOMAkurdi   | Pune        |
| BOMandheri  | Mumbai      |
| BOMBaner    | Pune        | 
| BOMdhanori  | Pune        |
| BOMjalgaon  | jalgaon     |
| BOMKharadi  | Pune        |
| BOMnagpur   |  nagpur     |
| BOMNigdi    | Pune        |
| BOMpimpri   | Pune        |
| BOMsatara   | satara      |
+-------------+-------------+
10 rows in set (0.00 sec)

create view view3 as select borrower.cust_name ,'Borrower' As type from Borrower UNION All
select Depositor.cust_name ,'Depositor' as type from Depositor;
Query OK, 0 rows affected (0.14 sec)
mysql> select *from view3;
+-----------+-----------+
| cust_name | type |
+-----------+-----------+
| divya | Borrower |

| dnyanda | Borrower |
| jaya | Borrower |
| maya | Borrower |
| neha | Borrower |
| nita | Borrower |
| sulekha | Borrower |
| sunita | Borrower |
| divya | Depositor |
| dnyanda | Depositor |
| jaya | Depositor |
| maya | Depositor |
| neha | Depositor |
| nita | Depositor |
| nitya | Depositor |
| ovi | Depositor |
| sulekha | Depositor |
| sunita | Depositor |
+-----------+-----------+
4.Create Union of left and right joint for all customers who have an account or loan or both at bank
mysql> select Customer.cust_name
-> from Customer
-> left join Depositor on Depositor.cust_name=Customer.cust_name
-> union
-> select Customer.cust_name
-> from Customer
-> Right join Borrower on Borrower.cust_name=Customer.cust_name;
+-----------+
| cust_name |
+-----------+
| divya |
| dnyanda |
| jaya |
| maya |
| neha |
| nita |
| nitya |
| ovi |
| sulekha |
| sunita |
+-----------+
5.Display content of View1,View2,View3
select *from view1 order By cust_name asc;
+-----------+
| cust_name |
+-----------+
| divya |
| nita |
+-----------+
+-------------+-------------+

| branch_name | branch_city |
+-------------+-------------+
| BOMAkurdi | Pune |
| BOMandheri | Mumbai |
| BOMBaner | Pune |
| BOMdhanori | Pune |
| BOMjalgaon | jalgaon |
| BOMKharadi | Pune |
| BOMnagpur | nagpur |
| BOMNigdi | Pune |
| BOMpimpri | Pune |
| BOMsatara | satara |
| BOMVardha | Vardha |
+-------------+-------------+
select *from view3;
+-----------+-----------+
| cust_name | type |
+-----------+-----------+
| divya | Borrower |
| dnyanda | Borrower |
| jaya | Borrower |
| maya | Borrower |
| neha | Borrower |
| nita | Borrower |
| sulekha | Borrower |
| sunita | Borrower |
| divya | Depositor |
| dnyanda | Depositor |
| jaya | Depositor |
| maya | Depositor |
| neha | Depositor |
| nita | Depositor |
| nitya | Depositor |
| ovi | Depositor |
| sulekha | Depositor |
| sunita | Depositor |
+-----------+-----------+

6.Create Simple and Unique index.
Create Index id_no on Account (Acc_no);
Query OK, 0 rows affected (0.65 sec)
Create unique index id_unique_acc on Account(Acc_no);
Query OK, 0 rows affected (0.54 sec)
7.Display index Information
show index from Account;
+---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------
+------+------------+---------+---------------+---------+------------+

| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality |
Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------
+------+------------+---------+---------------+---------+------------+
| account | 0 | PRIMARY | 1 | Acc_no | A | 10 | NULL | NULL | |
BTREE | | | YES | NULL |
| account | 1 | branch_name | 1 | branch_name | A | 8 | NULL | NULL |
YES | BTREE | | | YES | NULL |
| account | 1 | id_no | 1 | Acc_no | A | 10 | NULL | NULL | |
BTREE | | | YES | NULL |
+---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------
+------+------------+---------+---------------+---------
show index from Account;
+---------+------------+---------------+--------------+-------------+-----------+-------------+----------+--------
+------+------------+---------+---------------+---------+------------+
| Table | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality |
Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+---------------+--------------+-------------+-----------+-------------+----------+--------
+------+------------+---------+---------------+---------+------------+
| account | 0 | PRIMARY | 1 | Acc_no | A | 10 | NULL | NULL |
| BTREE | | | YES | NULL |
| account | 0 | id_unique_acc | 1 | Acc_no | A | 10 | NULL | NULL | |
BTREE | | | YES | NULL |
| account | 1 | branch_name | 1 | branch_name | A | 8 | NULL | NULL |
YES | BTREE | | | YES | NULL |
| account | 1 | id_no | 1 | Acc_no | A | 10 | NULL | NULL | |
BTREE | | | YES | NULL |
+---------+------------+---------------+--------------+-------------+-----------+-------------+----------+--------
+------+------------+---------+---------------+-------
8.Truncate table Customer.
mysql> alter table Borrower Drop foreign key borrower_ibfk_1;
Query OK, 0 rows affected (0.28 sec)
Records: 0 Duplicates: 0 Warnings: 0
mysql> truncate table Customer;
Query OK, 0 rows affected (1.02 sec)
mysql> select * from customer;
Empty set (0.00 sec)
create table Companies(comp_id varchar(20) primary key, name varchar(20), cost int,year
int(5));
insert into Companies
-> values('C001','ONGC',2000,2010),
-> ('C002','HPCL',2500,2012),
-> ('C005','IOCL',1000,2014),
-> ('C006','BHEL',3000,2015);
create table Orders(comp_id varchar(20) , domain varchar(20),quantity int,foreign key(comp_id)
references Companies(comp_id));
insert into Orders

-> values('C001','oil',109),
-> ('C002','gas',121),
-> ('C005','telecom',115);
1.Find names, costs, domains and quantities for companies using inner join.
select Companies.name,Companies.cost,Orders.domain,Orders.quantity from Companies inner join
Orders on Companies.comp_id=Orders.comp_id;
+------+------+---------+----------+
| name | cost | domain | quantity |
+------+------+---------+----------+
| ONGC | 2000 | oil | 109 |
| HPCL | 2500 | gas | 121 |
| IOCL | 1000 | telecom | 115 |
+------+------+---------+----------+
3 rows in set (0.00 sec)
2. Find names, costs, domains and quantities for companies using left outer join.
mysql> select Companies.name,Companies.cost,Orders.domain,Orders.quantity from Companies
left join Orders on Companies.comp_id=Orders.comp_id;
+------+------+---------+----------+
| name | cost | domain | quantity |
+------+------+---------+----------+
| ONGC | 2000 | oil | 109 |
| HPCL | 2500 | gas | 121 |
| IOCL | 1000 | telecom | 115 |
| BHEL | 3000 | NULL | NULL |
+------+------+---------+----------+
4 rows in set (0.05 sec)
3.Find names, costs, domains and quantities for companies using right outer join.
mysql> select Companies.name,Companies.cost,Orders.domain,Orders.quantity from Companies
right join Orders on Companies.comp_id=Orders.comp_id;
+------+------+---------+----------+
| name | cost | domain  | quantity |
+------+------+---------+----------+
| ONGC | 2000 | oil     | 109      |
| HPCL | 2500 | gas     | 121      |
| IOCL | 1000 | telecom | 115      |
+------+------+---------+----------+
4.Find names, costs, domains and quantities for companies using Union operator.
SELECT name AS Name, cost AS Cost, '-' AS Domain, '-' AS Quantity
FROM Companies
UNION
SELECT '-' As name ,'-' as cost, domain AS Domain, quantity AS Quantity
FROM Orders;
+------+------+---------+----------+
| Name | Cost | Domain  | Quantity |
+------+------+---------+----------+
| ONGC | 2000 | -       | -        |
| HPCL | 2500 | -       | -        |
| IOCL | 1000 | -       | -        |
| BHEL | 3000 | -       | -        |
| -    | -    | oil     | 109      |
| -    | -    | gas     | 121      |
| -    | -    | telecom | 115      |
+------+------+---------+----------+

5.Create View View1 by selecting both tables to show company name and quantities.
create view VIEW_1 as select Companies.name,Orders.quantity from Companies join Orders on
Companies.Comp_id=Orders.Comp_id;
Query OK, 0 rows affected (0.14 sec)
mysql> select * from VIEW_1;
+------+----------+
| name | quantity |
+------+----------+
| ONGC | 109      |
| HPCL | 121      |
| IOCL | 115      |
+------+----------+

6.Create View2 on Companies table by selecting any two columns and perform insert update delete
operations.
create view VIEW_2 as Select Companies.Comp_id,Companies.name From Companies;
Query OK, 0 rows affected (0.12 sec)
insert into VIEW_2 values('C003','BSNL');
Query OK, 1 row affected (0.10 sec)
select * from VIEW_2;
+---------+------+
| Comp_id | name |
+---------+------+
| C001    | ONGC |
| C002    | HPCL |
| C003    | BSNL |
| C005    | IOCL |
| C006    | BHEL |
+---------+------+
update VIEW_2
-> set Comp_id='C004'
-> where Comp_id='C003';
Query OK, 1 row affected (0.11 sec)
select * from VIEW_2;
+---------+------+
| Comp_id | name |
+---------+------+
| C001    | ONGC |
| C002    | HPCL |
| C004    | BSNL |
| C005    | IOCL |
| C006    | BHEL |
+---------+------+
delete from VIEW_2
-> where Comp_id='C004';
Query OK, 1 row affected (0.16 sec)
7.Display content of View1, View2.
mysql> select * from VIEW_1;
+------+----------+
| name | quantity |
+------+----------+
| ONGC | 109      |
| HPCL | 121      |
| IOCL | 115      |
+------+----------+

mysql> select * from VIEW_2;
+---------+------+
| Comp_id | name |
+---------+------+
| C001    | ONGC |
| C002    | HPCL |
| C005    | IOCL |
| C006    | BHEL |
+---------+------+