Enter password: **********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.24 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database address_book_service;
Query OK, 1 row affected (0.02 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book         |
| address_book_service |
| information_schema   |
| mysql                |
| payroll_service      |
| performance_schema   |
| sakila               |
| sys                  |
| test                 |
| world                |
+----------------------+
10 rows in set (0.04 sec)

mysql> drop address_book;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'address_book' at line 1
mysql> drop database address_book;
Query OK, 1 row affected (0.09 sec)

mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| address_book_service |
| information_schema   |
| mysql                |
| payroll_service      |
| performance_schema   |
| sakila               |
| sys                  |
| test                 |
| world                |
+----------------------+
9 rows in set (0.00 sec)

mysql> use address_book_service;
Database changed
mysql> select database();
+----------------------+
| database()           |
+----------------------+
| address_book_service |
+----------------------+
1 row in set (0.00 sec)

mysql> create table adressbook
    -> (
    -> id int unsigned not null auto_increment,
    -> first_name varchar(20) not null,
    -> last_name varchar(20),
    -> address varchar(20) not null,
    -> city varchar(20) not null,
    -> zip bigint not null,
    -> contact bigint not null,
    -> email varchar(100) not null,
    -> primary key(id)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> desc adressbook;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int unsigned | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(20)  | NO   |     | NULL    |                |
| last_name  | varchar(20)  | YES  |     | NULL    |                |
| address    | varchar(20)  | NO   |     | NULL    |                |
| city       | varchar(20)  | NO   |     | NULL    |                |
| zip        | bigint       | NO   |     | NULL    |                |
| contact    | bigint       | NO   |     | NULL    |                |
| email      | varchar(100) | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
8 rows in set (0.04 sec)

