mysql> use EMPLOYEE;
Database changed
mysql> SHOW TABLES;
+--------------------+
| Tables_in_employee |
+--------------------+
| course             |
| department         |
| employee           |
| faculty            |
| orders             |
| product            |
+--------------------+
6 rows in set (0.02 sec)

mysql> SELECT * FROM ORDERS
    -> ;
+---------+-----------+----------+--------+------------+
| orderid | ordername | custname | custid | orderdate  |
+---------+-----------+----------+--------+------------+
| c1      | pen       | fidha    | CP1    | 2030-12-12 |
| c2      | book      | hadiya   | CP2    | 2030-12-13 |
| c3      | cake      | wafa     | CP3    | 2030-12-14 |
| c4      | lipstick  | niba     | CP4    | 2030-12-15 |
| c5      | chair     | nisha    | CP5    | 2030-12-16 |
+---------+-----------+----------+--------+------------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM PRODUCT;
+--------+-------------+--------+
| prodid | productname | ordrid |
+--------+-------------+--------+
| b2     | book        | c1     |
| c3     | cake        | c2     |
| c4     | chair       | c3     |
| l4     | lipstick    | c4     |
| p1     | pen         | c5     |
+--------+-------------+--------+
5 rows in set (0.01 sec)

mysql> SELECT ORDERID,CUSTNAME FROM ORDERS O WHERE EXIST(SELECT * FROM PRODUCT P WHERE P.ORDERID=O.ORDRID);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT * FROM PRODUCT P WHERE P.ORDERID=O.ORDRID)' at line 1
mysql> SELECT orderid,custname FROM ORDERS O WHERE EXIST(SELECT * FROM PRODUCT P WHERE P.orderid=O.ordrid);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT * FROM PRODUCT P WHERE P.orderid=O.ordrid)' at line 1
mysql> SELECT orderid,custname FROM ORDERS O WHERE EXISTS(SELECT * FROM PRODUCT P WHERE P.orderid=O.ordrid);
ERROR 1054 (42S22): Unknown column 'P.orderid' in 'where clause'
mysql> SELECT orderid,custname FROM ORDERS O WHERE EXISTS(SELECT * FROM PRODUCT P WHERE P.ordrid=O.orderid);
+---------+----------+
| orderid | custname |
+---------+----------+
| c1      | fidha    |
| c2      | hadiya   |
| c3      | wafa     |
| c4      | niba     |
| c5      | nisha    |
+---------+----------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM course;
+-----------+----------+-------------+
| COURSE_ID | STAFF_ID | COURSE_NAME |
+-----------+----------+-------------+
| B1        | C1       | WPN         |
| B2        | C2       | CPN         |
| B3        | C3       | YPN         |
| B4        | C4       | YCN         |
| B5        | C5       | DDL         |
+-----------+----------+-------------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM department;
+-------+------------+--------+
| depid | depname    | deploc |
+-------+------------+--------+
| BVC4  | developing | delhi  |
| BVC4  | developing | delhi  |
| BVC4  | developing | delhi  |
+-------+------------+--------+
3 rows in set (0.01 sec)

mysql> SELECT * FROM faculty;
+-----+-------+----------+
| FNO | FNAME | STAFF_ID |
+-----+-------+----------+
| A1  | KJL   | C1       |
| A2  | KHH   | C2       |
| A3  | MMM   | C3       |
| A4  | KKK   | C4       |
| A5  | LLL   | C5       |
+-----+-------+----------+
5 rows in set (0.01 sec)

mysql> select * from course c where exists(select * from faculty f where f.STAFF_ID=C.STAFF_ID);
+-----------+----------+-------------+
| COURSE_ID | STAFF_ID | COURSE_NAME |
+-----------+----------+-------------+
| B1        | C1       | WPN         |
| B2        | C2       | CPN         |
| B3        | C3       | YPN         |
| B4        | C4       | YCN         |
| B5        | C5       | DDL         |
+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> select * from course c where exists(select * from faculty f where f.STAFF_ID=C.STAFF_ID);
+-----------+----------+-------------+
| COURSE_ID | STAFF_ID | COURSE_NAME |
+-----------+----------+-------------+
| B1        | C1       | WPN         |
| B2        | C2       | CPN         |
| B3        | C3       | YPN         |
| B4        | C4       | YCN         |
| B5        | C5       | DDL         |
+-----------+----------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM department;
+-------+------------+--------+
| depid | depname    | deploc |
+-------+------------+--------+
| BVC4  | developing | delhi  |
| BVC4  | developing | delhi  |
| BVC4  | developing | delhi  |
+-------+------------+--------+
3 rows in set (0.00 sec)

mysql> DELETE * FROM department WHERE deploc='delhi';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM department WHERE deploc='delhi'' at line 1
mysql> DELETE * FROM department WHERE depname='developing';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM department WHERE depname='developing'' at line 1
mysql> SELECT * FROM employee;
+-------+---------+-------------------+-----------------+-------------+----------+
| SSN   | Name    | Department        | Project         | Project_loc | salary   |
+-------+---------+-------------------+-----------------+-------------+----------+
| CVB1  | Febin   | Marketing manager | Banking         | Banglore    | 12000.00 |
| CVB10 | Ory     | Production        | Quality         | Delhi       | 54780.98 |
| CVB2  | Shebin  | Finance           | Finance Service | Delhi       | 15000.90 |
| CVB3  | Simon   | HR                | Developping     | Haiderabad  | 24000.00 |
| CVB4  | Revathy | Marketing         | Manufacture     | Banglore    | 77000.88 |
| CVB5  | Jecob   | Finance           | Accounting      | Chennai     | 11000.00 |
| CVB6  | Cathrin | Marketing         | Sales           | Kochi       | 89000.00 |
| CVB7  | Boby    | Production        | Manufacture     | Chennai     | 90000.00 |
| CVB8  | Koke    | Production        | Design          | Delhi       | 89000.00 |
| CVB9  | Mark    | HR                | Managing        | Delhi       | 54000.00 |
+-------+---------+-------------------+-----------------+-------------+----------+
10 rows in set (0.01 sec)

mysql> DELETE * FROM employee WHERE Name='ory';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM employee WHERE Name='ory'' at line 1
mysql> DELETE * FROM EMPLOYEE WHERE Name='ory';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM EMPLOYEE WHERE Name='ory'' at line 1
mysql> UPDATE * FROM FACULTY SET WHERE fname='ddd';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '* FROM FACULTY SET WHERE fname='ddd'' at line 1
mysql> UPDATE * FROM FACULTY SET WHERE FNAME='DDD'
