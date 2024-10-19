CREATE TABLE Account(
    -> Acc_no int NOT NULL,
    -> branch_name varchar(25),
    -> balance int,
    -> PRIMARY KEY(Acc_no)
    -> );

 CREATE TABLE Branch(
    -> branch_name varchar(50),
    -> branch_city varchar(50),
    -> assets decimal(15, 2),
    -> PRIMARY KEY (branch_name)
    -> );

 CREATE TABLE Customer(
    -> cust_name varchar(50),
    -> cust_street varchar(100),
    -> cust_city varchar(50),
    -> PRIMARY KEY (cust_name)
    -> );

 CREATE TABLE Deposit(
    -> cust_name varchar(30),
    -> acc_no int
    -> );

 CREATE TABLE Loan(
    -> loan_no int,
    -> branch_name varchar(50),
    -> amount int,
    -> PRIMARY KEY(loan_no)
    -> );

 CREATE TABLE Borrower(
    -> cust_name varchar(50),
    -> loan_no int
    -> );

ALTER TABLE Account ADD FOREIGN KEY (branch_name) REFERENCES Branch(branch_name);

ALTER TABLE Account ADD FOREIGN KEY (branch_name) REFERENCES Branch(branch_name);

desc Account;

+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| Acc_no      | int(11)     | NO   | PRI | NULL    |       |
| branch_name | varchar(25) | YES  | MUL | NULL    |       |
| balance     | int(11)     | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+

ALTER TABLE Deposit ADD FOREIGN KEY (cust_name) REFERENCES Customer(cust_name);

ALTER TABLE Deposit ADD FOREIGN KEY (acc_no) REFERENCES Account(acc_no);

ALTER TABLE Loan ADD FOREIGN KEY (branch_name) REFERENCES Account(branch_name);

ALTER TABLE Borrower ADD FOREIGN KEY (cust_name) REFERENCES Customer(cust_name);

ALTER TABLE Borrower ADD FOREIGN KEY (loan_no) REFERENCES Loan(loan_no);

INSERT INTO Branch(branch_name,branch_city,assets)VALUES('Koregaon','Pune',1234);
SELECT * FROM Branch;

+-------------+-------------+---------+
| branch_name | branch_city | assets  |
+-------------+-------------+---------+
| Koregaon    | Pune        | 1234.00 |
+-------------+-------------+---------+
1 row in set (0.00 sec)

INSERT INTO Account(Acc_no,branch_name,balance)VALUES(12345,'Koregaon',3210);
SELECT * FROM Account;

+--------+-------------+---------+
| Acc_no | branch_name | balance |
+--------+-------------+---------+
|  12345 | Koregaon    |    3210 |
+--------+-------------+---------+
1 row in set (0.00 sec)

INSERT INTO Customer(cust_name,cust_street,cust_city)VALUES('Sakshi','Vadgaonsheri','Pune'); 
SELECT * FROM Customer;
+-----------+--------------+-----------+
| cust_name | cust_street  | cust_city |
+-----------+--------------+-----------+
| Sakshi    | Vadgaonsheri | Pune      |
+-----------+--------------+-----------+
1 row in set (0.00 sec)