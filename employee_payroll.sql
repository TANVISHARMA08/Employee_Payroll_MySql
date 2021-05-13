Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.24 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> drop database payroll_service;
Query OK, 1 row affected (0.12 sec)

mysql> create database payroll_service;
Query OK, 1 row affected (0.04 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| payroll_service    |
| performance_schema |
| sakila             |
| sys                |
| test               |
| world              |
+--------------------+
8 rows in set (0.03 sec)

mysql> use payroll_service;
Database changed
mysql> select database();
+-----------------+
| database()      |
+-----------------+
| payroll_service |
+-----------------+
1 row in set (0.00 sec)

mysql> create table employee_payroll
    -> (
    -> id int unsigned not null auto_increment,
    -> name varchar(150) not null,
    -> salary double not null,
    -> start date not null,
    -> primary key(id)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> desc employee_payroll;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.04 sec)

mysql> insert into employee_payroll(name,salary,start)
    -> values('tanvi',400000,'2020-9-10'),
    -> ('tanya',350000,'2021-1-13'),
    -> ('sneha',780000,'2019-2-24');
Query OK, 3 rows affected (0.05 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  1 | tanvi | 400000 | 2020-09-10 |
|  2 | tanya | 350000 | 2021-01-13 |
|  3 | sneha | 780000 | 2019-02-24 |
+----+-------+--------+------------+
3 rows in set (0.00 sec)

mysql> select salary from employee_payroll
    -> where name = "tanvi";
+--------+
| salary |
+--------+
| 400000 |
+--------+
1 row in set (0.00 sec)

mysql> select * from employee_payroll
    -> where start between cast('2019-01-10' as date) and date(now());
+----+-------+--------+------------+
| id | name  | salary | start      |
+----+-------+--------+------------+
|  1 | tanvi | 400000 | 2020-09-10 |
|  2 | tanya | 350000 | 2021-01-13 |
|  3 | sneha | 780000 | 2019-02-24 |
+----+-------+--------+------------+
3 rows in set (0.03 sec)


mysql> alter table employee_payroll
    -> add gender varchar(1) not null after name;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+-------+--------+--------+------------+
| id | name  | gender | salary | start      |
+----+-------+--------+--------+------------+
|  1 | tanvi |        | 400000 | 2020-09-10 |
|  2 | tanya |        | 350000 | 2021-01-13 |
|  3 | sneha |        | 780000 | 2019-02-24 |
+----+-------+--------+--------+------------+
3 rows in set (0.00 sec)


+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| gender | varchar(1)   | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
5 rows in set (0.03 sec)



mysql> select * from employee_payroll;
+----+-------+--------+--------+------------+
| id | name  | gender | salary | start      |
+----+-------+--------+--------+------------+
|  1 | tanvi |        | 400000 | 2020-09-10 |
|  2 | tanya |        | 350000 | 2021-01-13 |
|  3 | sneha |        | 780000 | 2019-02-24 |
+----+-------+--------+--------+------------+
3 rows in set (0.00 sec)



mysql> update employee_payroll
    -> set gender = 'f'
    -> where name = 'tanvi' or
    -> name = 'tanya' or
    -> name = 'sneha'
    -> ;
Query OK, 3 rows affected (0.04 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from employee_payroll;
+----+-------+--------+--------+------------+
| id | name  | gender | salary | start      |
+----+-------+--------+--------+------------+
|  1 | tanvi | f      | 400000 | 2020-09-10 |
|  2 | tanya | f      | 350000 | 2021-01-13 |
|  3 | sneha | f      | 780000 | 2019-02-24 |
+----+-------+--------+--------+------------+
3 rows in set (0.03 sec)

mysql> insert into employee_payroll(name,gender,salary,start) values
    -> ('saket','m',1828290,'2021-03-01'),
    -> ('satya','m',2881910,'2020-09-20');
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+----+-------+--------+---------+------------+
| id | name  | gender | salary  | start      |
+----+-------+--------+---------+------------+
|  1 | tanvi | f      |  400000 | 2020-09-10 |
|  2 | tanya | f      |  350000 | 2021-01-13 |
|  3 | sneha | f      |  780000 | 2019-02-24 |
|  4 | saket | m      | 1828290 | 2021-03-01 |
|  5 | satya | m      | 2881910 | 2020-09-20 |
+----+-------+--------+---------+------------+
5 rows in set (0.03 sec)

mysql> select sum(salary) from employee_payroll
    -> where gender = 'm'
    -> group by gender;
+-------------+
| sum(salary) |
+-------------+
|     4710200 |
+-------------+
1 row in set (0.03 sec)

mysql>  select sum(salary) from employee_payroll
    -> where gender = 'f' group by gender;
+-------------+
| sum(salary) |
+-------------+
|     1530000 |
+-------------+
1 row in set (0.00 sec)

mysql>  select avg(salary) from employee_payroll where gender ='m' group by gender;
+-------------+
| avg(salary) |
+-------------+
|     2355100 |
+-------------+
1 row in set (0.00 sec)

mysql> select avg(salary) from employee_payroll where gender ='f' group by gender;
+-------------+
| avg(salary) |
+-------------+
|      510000 |
+-------------+
1 row in set (0.00 sec)

mysql> select max(salary) from employee_payroll where gender ='f' group by gender;
+-------------+
| max(salary) |
+-------------+
|      780000 |
+-------------+
1 row in set (0.03 sec)

mysql> select min(salary) from employee_payroll where gender ='f' group by gender;
+-------------+
| min(salary) |
+-------------+
|      350000 |
+-------------+
1 row in set (0.00 sec)

mysql> select count(*) from  employee_payroll where gender = 'f';
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.03 sec)

mysql> select count(*) from  employee_payroll where gender = 'm';
+----------+
| count(*) |
+----------+
|        2 |
+----------+
1 row in set (0.00 sec)

mysql>