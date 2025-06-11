hushi@arcgate2743:~$ sudo mysql 
[sudo] password for khushi: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.4.5 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database sql_intermidiate_level_assignment;
Query OK, 1 row affected (0.04 sec)

mysql> Use sql_intermidiate_level_assignment;
Database changed
mysql> -- Customers Table
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     Email VARCHAR(100),
    ->     JoinDate DATE,
    ->     Country VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> -- Products Table
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE TABLE Products (
    ->     ProductID INT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     Category VARCHAR(50),
    ->     Price DECIMAL(10, 2),
    ->     Stock INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql>  Orders Table
    -> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    -> CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount DECIMAL(10, 2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
CustomerID INT,
' at line 1
mysql> - Orders Table
    -> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount DECIMAL(10, 2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID' at line 1
mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     OrderDate DATE,
    ->     TotalAmount DECIMAL(10, 2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Shipping (
    ->     ShippingID INT PRIMARY KEY,
    ->     OrderID INT,
    ->     ShippingDate DATE,
    ->     DeliveryDate DATE,
    ->     Status VARCHAR(50),
    ->     FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE Reviews (
    ->     ReviewID INT PRIMARY KEY,
    ->     ProductID INT,
    ->     CustomerID INT,
    ->     Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ->     ReviewText TEXT,
    ->     ReviewDate DATE,
    ->     FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO Customers (CustomerID, Name, Email, JoinDate, Country) VALUES
    -> (1, 'Alice Johnson', 'alice@example.com', '2023-01-15', 'United States'),
    -> (2, 'Bob Smith', 'bob@example.com', '2023-02-20', 'Canada'),
    -> (3, 'Charlie Brown', 'charlie@example.com', '2023-03-05', 'United Kingdom');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
    -> (1, 'Wireless Mouse', 'Electronics', 25.99, 150),
    -> (2, 'Bluetooth Headphones', 'Electronics', 79.99, 100),
    -> (3, 'Notebook', 'Stationery', 5.49, 300);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
    -> (1, 1, '2023-03-10', 51.98),
    -> (2, 2, '2023-03-15', 79.99),
    -> (3, 3, '2023-03-20', 16.47);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Shipping (ShippingID, OrderID, ShippingDate, DeliveryDate, Status) VALUES
    -> (1, 1, '2023-03-11', '2023-03-14', 'Delivered'),
    -> (2, 2, '2023-03-16', '2023-03-20', 'Delivered'),
    -> (3, 3, '2023-03-21', NULL, 'In Transit');
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, ReviewText, ReviewDate) VALUES
    -> (1, 1, 1, 5, 'Great product! Works perfectly.', '2023-03-12'),
    -> (2, 2, 2, 4, 'Good sound quality, but a bit pricey.', '2023-03-18'),
    -> (3, 3, 3, 3, 'Decent notebook, but paper quality could be better.', '2023-03-22');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> Select Name , Email From Customers;
+---------------+---------------------+
| Name          | Email               |
+---------------+---------------------+
| Alice Johnson | alice@example.com   |
| Bob Smith     | bob@example.com     |
| Charlie Brown | charlie@example.com |
+---------------+---------------------+
3 rows in set (0.00 sec)

mysql> ^C
mysql> ^C
mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select Name, Category, Price 
    -> From Products;
+----------------------+-------------+-------+
| Name                 | Category    | Price |
+----------------------+-------------+-------+
| Wireless Mouse       | Electronics | 25.99 |
| Bluetooth Headphones | Electronics | 79.99 |
| Notebook             | Stationery  |  5.49 |
+----------------------+-------------+-------+
3 rows in set (0.00 sec)

mysql> Select count(*) as count_of_products
    -> From Products
    -> Where Category = 'Electronics';
+-------------------+
| count_of_products |
+-------------------+
|                 2 |
+-------------------+
1 row in set (0.00 sec)

mysql> Select * from Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2023-03-10 |       51.98 |
|       2 |          2 | 2023-03-15 |       79.99 |
|       3 |          3 | 2023-03-20 |       16.47 |
+---------+------------+------------+-------------+
3 rows in set (0.00 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> Select Orders.OrderID, Orders.OrderDate,Orders.TotalAmount, Customers.CustomerID, Customers.Name
    -> From Orders 
    -> Join Customers 
    -> ON 
    -> Orders.CustomerID = Customers.CustomerID
    -> Where Country = 'United States';
+---------+------------+-------------+------------+---------------+
| OrderID | OrderDate  | TotalAmount | CustomerID | Name          |
+---------+------------+-------------+------------+---------------+
|       1 | 2023-03-10 |       51.98 |          1 | Alice Johnson |
+---------+------------+-------------+------------+---------------+
1 row in set (0.00 sec)

mysql> Select Sum(TotalAmount) as Revenue
    -> From Orders;
+---------+
| Revenue |
+---------+
|  148.44 |
+---------+
1 row in set (0.00 sec)

mysql> Select Customers.CustomerID, Customers.Name , Orders.OrderID,Orders.OrderDate , Orders.TotalAmount
    -> From Customers
    -> Join Orders On 
    -> Customers.CustomerID = Orders.CustomerID
    -> Order by TotalAmount DESC
    -> Limit 1;
+------------+-----------+---------+------------+-------------+
| CustomerID | Name      | OrderID | OrderDate  | TotalAmount |
+------------+-----------+---------+------------+-------------+
|          2 | Bob Smith |       2 | 2023-03-15 |       79.99 |
+------------+-----------+---------+------------+-------------+
1 row in set (0.00 sec)

mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select ProductID,Name 
    -> From Products
    -> Where Stocks >= 50 ;'
ERROR 1054 (42S22): Unknown column 'Stocks' in 'where clause'
    '> ;
    '> ^C
mysql> Select ProductID,Name  From Products Where Stock >= 50;
+-----------+----------------------+
| ProductID | Name                 |
+-----------+----------------------+
|         1 | Wireless Mouse       |
|         2 | Bluetooth Headphones |
|         3 | Notebook             |
+-----------+----------------------+
3 rows in set (0.00 sec)

mysql> Select ProductID,Name  From Products Where Stock < 50;
Empty set (0.00 sec)

mysql> Select * from Reviews;
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
| ReviewID | ProductID | CustomerID | Rating | ReviewText                                          | ReviewDate |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
|        1 |         1 |          1 |      5 | Great product! Works perfectly.                     | 2023-03-12 |
|        2 |         2 |          2 |      4 | Good sound quality, but a bit pricey.               | 2023-03-18 |
|        3 |         3 |          3 |      3 | Decent notebook, but paper quality could be better. | 2023-03-22 |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
3 rows in set (0.00 sec)

mysql> Select ReviewID, Rating, ReviewText , ReviewDate 
    -> From Reviews
    -> Where Rating >= 4;
+----------+--------+---------------------------------------+------------+
| ReviewID | Rating | ReviewText                            | ReviewDate |
+----------+--------+---------------------------------------+------------+
|        1 |      5 | Great product! Works perfectly.       | 2023-03-12 |
|        2 |      4 | Good sound quality, but a bit pricey. | 2023-03-18 |
+----------+--------+---------------------------------------+------------+
2 rows in set (0.00 sec)

mysql> Select * from Reviews
    -> Where Rating >= 4;
+----------+-----------+------------+--------+---------------------------------------+------------+
| ReviewID | ProductID | CustomerID | Rating | ReviewText                            | ReviewDate |
+----------+-----------+------------+--------+---------------------------------------+------------+
|        1 |         1 |          1 |      5 | Great product! Works perfectly.       | 2023-03-12 |
|        2 |         2 |          2 |      4 | Good sound quality, but a bit pricey. | 2023-03-18 |
+----------+-----------+------------+--------+---------------------------------------+------------+
2 rows in set (0.00 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> Select * from Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2023-03-10 |       51.98 |
|       2 |          2 | 2023-03-15 |       79.99 |
|       3 |          3 | 2023-03-20 |       16.47 |
+---------+------------+------------+-------------+
3 rows in set (0.00 sec)

mysql> Select Orders.OrderID, Orders.OrderDate, Orders.TotalAmount , Customers.Name, Customers.Email
    -> from Orders
    -> Join Customers On 
    -> Orders.CustomerID = Customers.CustomerID
    -> ;
+---------+------------+-------------+---------------+---------------------+
| OrderID | OrderDate  | TotalAmount | Name          | Email               |
+---------+------------+-------------+---------------+---------------------+
|       1 | 2023-03-10 |       51.98 | Alice Johnson | alice@example.com   |
|       2 | 2023-03-15 |       79.99 | Bob Smith     | bob@example.com     |
|       3 | 2023-03-20 |       16.47 | Charlie Brown | charlie@example.com |
+---------+------------+-------------+---------------+---------------------+
3 rows in set (0.00 sec)

mysql> Select Orders.OrderID, Orders.OrderDate, Orders.TotalAmount ,Customers.CustomerID, Customers.Name, Customers.Email from Orders Join Customers On  Orders.CustomerID = Customers.CustomerID;
+---------+------------+-------------+------------+---------------+---------------------+
| OrderID | OrderDate  | TotalAmount | CustomerID | Name          | Email               |
+---------+------------+-------------+------------+---------------+---------------------+
|       1 | 2023-03-10 |       51.98 |          1 | Alice Johnson | alice@example.com   |
|       2 | 2023-03-15 |       79.99 |          2 | Bob Smith     | bob@example.com     |
|       3 | 2023-03-20 |       16.47 |          3 | Charlie Brown | charlie@example.com |
+---------+------------+-------------+------------+---------------+---------------------+
3 rows in set (0.00 sec)

mysql> Select * from Reviews;
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
| ReviewID | ProductID | CustomerID | Rating | ReviewText                                          | ReviewDate |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
|        1 |         1 |          1 |      5 | Great product! Works perfectly.                     | 2023-03-12 |
|        2 |         2 |          2 |      4 | Good sound quality, but a bit pricey.               | 2023-03-18 |
|        3 |         3 |          3 |      3 | Decent notebook, but paper quality could be better. | 2023-03-22 |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
3 rows in set (0.00 sec)

mysql> Select * Products;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Products' at line 1
mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> Select Reviews.ReviewID, Reviews.Rating, Reviews.ReviewText, Reviews.ReviewDate 
    -> , Products.Name as Product_name,
    -> Customers.Name as Customers_name
    -> From Reviews 
    -> Join Products on Reviews.ProductID = Products.ProductID
    -> Join Customers on Reviews.CustomerID = Customers.CustomerID;
+----------+--------+-----------------------------------------------------+------------+----------------------+----------------+
| ReviewID | Rating | ReviewText                                          | ReviewDate | Product_name         | Customers_name |
+----------+--------+-----------------------------------------------------+------------+----------------------+----------------+
|        1 |      5 | Great product! Works perfectly.                     | 2023-03-12 | Wireless Mouse       | Alice Johnson  |
|        2 |      4 | Good sound quality, but a bit pricey.               | 2023-03-18 | Bluetooth Headphones | Bob Smith      |
|        3 |      3 | Decent notebook, but paper quality could be better. | 2023-03-22 | Notebook             | Charlie Brown  |
+----------+--------+-----------------------------------------------------+------------+----------------------+----------------+
3 rows in set (0.01 sec)

mysql> Select Avg(Rating) as Average_Rating 
    -> From Reviewsl;
ERROR 1146 (42S02): Table 'sql_intermidiate_level_assignment.Reviewsl' doesn't exist
mysql> Select Avg(Rating) as Average_Rating  From Reviews;
+----------------+
| Average_Rating |
+----------------+
|         4.0000 |
+----------------+
1 row in set (0.00 sec)

mysql> Select * from Reviews;
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
| ReviewID | ProductID | CustomerID | Rating | ReviewText                                          | ReviewDate |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
|        1 |         1 |          1 |      5 | Great product! Works perfectly.                     | 2023-03-12 |
|        2 |         2 |          2 |      4 | Good sound quality, but a bit pricey.               | 2023-03-18 |
|        3 |         3 |          3 |      3 | Decent notebook, but paper quality could be better. | 2023-03-22 |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
3 rows in set (0.00 sec)

mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select Avg(Rating) from Reviews;
+-------------+
| Avg(Rating) |
+-------------+
|      4.0000 |
+-------------+
1 row in set (0.01 sec)

mysql> Select Products.ProductID,Products.Name  ad Product_name , 
    -> Avg(Rating) as Average_rating_per_product
    -> From Reviews
    -> Join Products On 
    -> Reviews.ProductID = Products.ProductID
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Product_name , 
Avg(Rating) as Average_rating_per_product
From Reviews
Join Prod' at line 1
mysql> Select Products.ProductID,Products.Name AS Product_name ,  Avg(Rating) as Average_rating_per_product From Reviews Join Products On  Reviews.ProductID = Products.ProductID;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sql_intermidiate_level_assignment.Products.ProductID'; this is incompatible with sql_mode=only_full_group_by
mysql> Select Products.ProductID,Products.Name AS Product_name ,  Avg(Rating) as Average_rating_per_product From Reviews Join Products On  Reviews.ProductID = Products.ProductID
    -> Group by Products.Id, Products.Name;
ERROR 1054 (42S22): Unknown column 'Products.Id' in 'group statement'
mysql> Select Products.ProductID,Products.Name AS Product_name ,  Avg(Rating) as Average_rating_per_product From Reviews Join Products On  Reviews.ProductID = Products.ProductID Group by Products.ProductId, Products.Name;
+-----------+----------------------+----------------------------+
| ProductID | Product_name         | Average_rating_per_product |
+-----------+----------------------+----------------------------+
|         1 | Wireless Mouse       |                     5.0000 |
|         2 | Bluetooth Headphones |                     4.0000 |
|         3 | Notebook             |                     3.0000 |
+-----------+----------------------+----------------------------+
3 rows in set (0.08 sec)

mysql> Select * from Produsts;
ERROR 1146 (42S02): Table 'sql_intermidiate_level_assignment.Produsts' doesn't exist
mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select Sum(Price) as Revenue
    -> From Products
    -> ;
+---------+
| Revenue |
+---------+
|  111.47 |
+---------+
1 row in set (0.00 sec)

mysql> Select ProductID, Category, Sum(Price) as Revenue From Products;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sql_intermidiate_level_assignment.Products.ProductID'; this is incompatible with sql_mode=only_full_group_by
mysql> Select Category, Sum(Price) as Revenue From Products Group by Category;
+-------------+---------+
| Category    | Revenue |
+-------------+---------+
| Electronics |  105.98 |
| Stationery  |    5.49 |
+-------------+---------+
2 rows in set (0.00 sec)

mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select * from Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2023-03-10 |       51.98 |
|       2 |          2 | 2023-03-15 |       79.99 |
|       3 |          3 | 2023-03-20 |       16.47 |
+---------+------------+------------+-------------+
3 rows in set (0.00 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.01 sec)

mysql> Select Country ,Count(*) as total_count 
    -> From Customers
    -> Order by Count(*) DESC LIMIT 1;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sql_intermidiate_level_assignment.Customers.Country'; this is incompatible with sql_mode=only_full_group_by
mysql> Select Country, Count(*) as total_count
    -> From Customers
    -> Group by Country 
    -> Where Count(*) DESC 
    -> LIMIT 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Where Count(*) DESC 
LIMIT 1' at line 4
mysql> Select Country, Count(*) as total_count From Customers Group by Country Order by  Count(*) DESC  LIMIT 1;
+---------------+-------------+
| Country       | total_count |
+---------------+-------------+
| United States |           1 |
+---------------+-------------+
1 row in set (0.00 sec)

mysql> Select * from orders;
ERROR 1146 (42S02): Table 'sql_intermidiate_level_assignment.orders' doesn't exist
mysql> Select * from Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2023-03-10 |       51.98 |
|       2 |          2 | 2023-03-15 |       79.99 |
|       3 |          3 | 2023-03-20 |       16.47 |
+---------+------------+------------+-------------+
3 rows in set (0.00 sec)

mysql> Select * from Orders
    -> Where OrderDate > '2023-03-01';
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2023-03-10 |       51.98 |
|       2 |          2 | 2023-03-15 |       79.99 |
|       3 |          3 | 2023-03-20 |       16.47 |
+---------+------------+------------+-------------+
3 rows in set (0.00 sec)

mysql> Select * from Shipping;
+------------+---------+--------------+--------------+------------+
| ShippingID | OrderID | ShippingDate | DeliveryDate | Status     |
+------------+---------+--------------+--------------+------------+
|          1 |       1 | 2023-03-11   | 2023-03-14   | Delivered  |
|          2 |       2 | 2023-03-16   | 2023-03-20   | Delivered  |
|          3 |       3 | 2023-03-21   | NULL         | In Transit |
+------------+---------+--------------+--------------+------------+
3 rows in set (0.00 sec)

mysql> Select * from Shipping
    -> where Status = 'In Transit';
+------------+---------+--------------+--------------+------------+
| ShippingID | OrderID | ShippingDate | DeliveryDate | Status     |
+------------+---------+--------------+--------------+------------+
|          3 |       3 | 2023-03-21   | NULL         | In Transit |
+------------+---------+--------------+--------------+------------+
1 row in set (0.00 sec)

mysql> Select * from Reviews;
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
| ReviewID | ProductID | CustomerID | Rating | ReviewText                                          | ReviewDate |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
|        1 |         1 |          1 |      5 | Great product! Works perfectly.                     | 2023-03-12 |
|        2 |         2 |          2 |      4 | Good sound quality, but a bit pricey.               | 2023-03-18 |
|        3 |         3 |          3 |      3 | Decent notebook, but paper quality could be better. | 2023-03-22 |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
3 rows in set (0.02 sec)

mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.01 sec)

mysql> Select Products.ID, Products.Name, Avg(Reviews.Rating)
    -> From Reviews 
    -> Join Products On 
    -> Reviews.ProductID = Products.ProductID
    -> Group by Products.ProductOS;
ERROR 1054 (42S22): Unknown column 'Products.ID' in 'field list'
mysql> Select Products.ProductID, Products.Name, Avg(Reviews.Rating) From Reviews  Join Products On  Reviews.ProductID = Products.ProductID Group by Products.ProductID, Products.Name 
    -> order by Avg(Reviews.Rating) DESC limit 1;
+-----------+----------------+---------------------+
| ProductID | Name           | Avg(Reviews.Rating) |
+-----------+----------------+---------------------+
|         1 | Wireless Mouse |              5.0000 |
+-----------+----------------+---------------------+
1 row in set (0.00 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.03 sec)

mysql> Select * from Reviews;
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
| ReviewID | ProductID | CustomerID | Rating | ReviewText                                          | ReviewDate |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
|        1 |         1 |          1 |      5 | Great product! Works perfectly.                     | 2023-03-12 |
|        2 |         2 |          2 |      4 | Good sound quality, but a bit pricey.               | 2023-03-18 |
|        3 |         3 |          3 |      3 | Decent notebook, but paper quality could be better. | 2023-03-22 |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
3 rows in set (0.00 sec)

mysql> Select count(*) as count_Review
    -> From Reviews
    -> Where ReviewID >= 1;
+--------------+
| count_Review |
+--------------+
|            3 |
+--------------+
1 row in set (0.03 sec)

mysql> Select Customers.Name as customer_name, count(*) as count_Review From Reviews
    -> Join Customers On 
    -> Reviews.CustomerID = Customers.CustomerID
    -> Group by Customers.name
    -> where Reviews.ReviewID >= 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where Reviews.ReviewID >= 1' at line 5
mysql> Select Customers.Name as customer_name, count(*) as count_Review From Reviews Join Customers On  Reviews.CustomerID = Customers.CustomerID where Reviews.ReviewID >= 1;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sql_intermidiate_level_assignment.Customers.Name'; this is incompatible with sql_mode=only_full_group_by
mysql> Select Customers.Name as customer_name, count(*) as count_Review From Reviews Join Customers On  Reviews.CustomerID = Customers.CustomerID Group by Customers.name where Reviews.ReviewID >= 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where Reviews.ReviewID >= 1' at line 1
mysql> 
mysql> 
mysql> 
mysql> 
mysql> Select Customers.CustomerID , Count(*) as count_review 
    -> From Reviews
    -> Where Customers.CustomerID In 
    -> (Select Customers.CustomerID From reviews where ProductID = 1
    -> group by Customers.CustomerID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5
mysql> Select Customers.CustomerID , Count(*) as count_review  From Reviews Where Customers.CustomerID In  (Select Customers.CustomerID From reviews where ProductID >= 1) Group by Customers.CustomerID;
ERROR 1146 (42S02): Table 'sql_intermidiate_level_assignment.reviews' doesn't exist
mysql> Select Customers.CustomerID , Count(*) as count_review  From Reviews Where Customers.CustomerID In  (Select Customers.CustomerID From Reviews where ProductID >= 1) Group by Customers.CustomerID;
ERROR 1054 (42S22): Unknown column 'Customers.CustomerID' in 'field list'
mysql> Select Customers.CustomerID , Count(*) as count_review  From Reviews Where Customers.CustomerID In  (Select Customers.CustomerID From Reviews where ProductID >= 1) Group by Customers.CustomerID;
ERROR 1054 (42S22): Unknown column 'Customers.CustomerID' in 'field list'
mysql> Select Customers.Name , Count(*) as count_review  From Reviews Where Customers.CustomerID In  (Select Customers.CustomerID From Reviews where ProductID >= 1) Group by Customers.Name;
ERROR 1054 (42S22): Unknown column 'Customers.Name' in 'field list'
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> Select Customers.Name , Count(*) as count_review
    -> From Customers;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sql_intermidiate_level_assignment.Customers.Name'; this is incompatible with sql_mode=only_full_group_by
mysql> Select Customers.Name , Count(*) as count_review From Customers Group by Customers.Name ;
+---------------+--------------+
| Name          | count_review |
+---------------+--------------+
| Alice Johnson |            1 |
| Bob Smith     |            1 |
| Charlie Brown |            1 |
+---------------+--------------+
3 rows in set (0.00 sec)

mysql> Select Customers.ID , Customers.Name, Customers.Email, Customers.Country
    -> From Customers
    -> Join Reviews on 
    -> Customers.CustomerID = Reviews.CustomerID;
ERROR 1054 (42S22): Unknown column 'Customers.ID' in 'field list'
mysql> Select Customers.CustomerID , Customers.Name, Customers.Email, Customers.Country From Customers Join Reviews on  Customers.CustomerID = Reviews.CustomerID;
+------------+---------------+---------------------+----------------+
| CustomerID | Name          | Email               | Country        |
+------------+---------------+---------------------+----------------+
|          1 | Alice Johnson | alice@example.com   | United States  |
|          2 | Bob Smith     | bob@example.com     | Canada         |
|          3 | Charlie Brown | charlie@example.com | United Kingdom |
+------------+---------------+---------------------+----------------+
3 rows in set (0.00 sec)

mysql> Select distict Customers.CustomerID , Customers.Name, Customers.Email, Customers.Country From Customers Join Reviews on  Customers.CustomerID = Reviews.CustomerID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '.CustomerID , Customers.Name, Customers.Email, Customers.Country From Customers ' at line 1
mysql> Select Distinct Customers.CustomerID , Customers.Name, Customers.Email, Customers.Country From Customers Join Reviews on  Customers.CustomerID = Reviews.CustomerID;
+------------+---------------+---------------------+----------------+
| CustomerID | Name          | Email               | Country        |
+------------+---------------+---------------------+----------------+
|          1 | Alice Johnson | alice@example.com   | United States  |
|          2 | Bob Smith     | bob@example.com     | Canada         |
|          3 | Charlie Brown | charlie@example.com | United Kingdom |
+------------+---------------+---------------------+----------------+
3 rows in set (0.00 sec)

mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select * from Reviews
    -> ;
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
| ReviewID | ProductID | CustomerID | Rating | ReviewText                                          | ReviewDate |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
|        1 |         1 |          1 |      5 | Great product! Works perfectly.                     | 2023-03-12 |
|        2 |         2 |          2 |      4 | Good sound quality, but a bit pricey.               | 2023-03-18 |
|        3 |         3 |          3 |      3 | Decent notebook, but paper quality could be better. | 2023-03-22 |
+----------+-----------+------------+--------+-----------------------------------------------------+------------+
3 rows in set (0.00 sec)

mysql> Select Products.ProductID, Products.Name, Products.Category, Products.Price ,Reviews.ReviewID
    -> From Products
    -> Join Reviews on Products.ProductID = Reviews.ProductID
    -> ;
+-----------+----------------------+-------------+-------+----------+
| ProductID | Name                 | Category    | Price | ReviewID |
+-----------+----------------------+-------------+-------+----------+
|         1 | Wireless Mouse       | Electronics | 25.99 |        1 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |        2 |
|         3 | Notebook             | Stationery  |  5.49 |        3 |
+-----------+----------------------+-------------+-------+----------+
3 rows in set (0.00 sec)

mysql> Select * from Products Where ProductId Not in(Select Distinct ProductID from Reviews);
Empty set (0.02 sec)

mysql> Select Products.ProductID , Products.Name
    -> From Products 
    -> left join Reviews on 
    -> Products.ProductID = Reviews.ProductID
    -> Where Reviews.ProductID IS NUll;
ERROR 4031 (HY000): The client was disconnected by the server because of inactivity. See wait_timeout and interactive_timeout for configuring this behavior.
No connection. Trying to reconnect...
Connection id:    16
Current database: sql_intermidiate_level_assignment

Empty set (0.05 sec)

mysql> Create table OrderItems(
    -> OrderItemID Int Primary Key Auto_Increment, 
    -> OrderID Int,
    -> ProductID INT,
    ->     Quantity INT,
    ->     FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    ->     FOREIGN KEY (ProductID) REFERENCES Products(ProductID));
Query OK, 0 rows affected (0.10 sec)

mysql> INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES
    -> (1, 1, 2),  -- Wireless Mouse → 2 × 25.99 = 51.98
    -> (2, 2, 1),  -- Bluetooth Headphones → 1 × 79.99
    -> (3, 3, 3);  -- Notebook → 3 × 5.49 = 16.47
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> Select * from OrderItems;
+-------------+---------+-----------+----------+
| OrderItemID | OrderID | ProductID | Quantity |
+-------------+---------+-----------+----------+
|           1 |       1 |         1 |        2 |
|           2 |       2 |         2 |        1 |
|           3 |       3 |         3 |        3 |
+-------------+---------+-----------+----------+
3 rows in set (0.00 sec)

mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.02 sec)

mysql> Select * from Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2023-03-10 |       51.98 |
|       2 |          2 | 2023-03-15 |       79.99 |
|       3 |          3 | 2023-03-20 |       16.47 |
+---------+------------+------------+-------------+
3 rows in set (0.01 sec)

mysql> Select Products.ProductID, Products.Name, 
    -> Sum(OderItems.Quantity * Products.Price) as Sale_product
    -> From Products
    -> Join OrderItems on 
    -> Products.ProductID = Products.Name
    -> Order by Sale_product Desc
    -> Limit 1;
ERROR 1054 (42S22): Unknown column 'OderItems.Quantity' in 'field list'
mysql> Select Products.ProductID, Products.Name,  Sum(OrderItems.Quantity * Products.Price) as Sale_p
roduct From Products Join OrderItems on  Products.ProductID = Products.Name Order by Sale_product Des
c Limit 1;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sql_intermidiate_level_assignment.Products.ProductID'; this is incompatible with sql_mode=only_full_group_by
mysql> Select Products.ProductID, Products.Name,  Sum(OrderItems.Quantity * Products.Price) as Sale_product From Products Join OrderItems on  Products.ProductID = Products.Name Order by Sale_product Desc Limit 1;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sql_intermidiate_level_assignment.Products.ProductID'; this is incompatible with sql_mode=only_full_group_by
mysql> Select Products.ProductID, Products.Name,  Sum(OrderItems.Quantity * Products.Price) as Sale_product From Products Join OrderItems on  Products.ProductID = Products.Name Group by Products.ProductID , Products.Name Order by Sale_product Desc Limit 1;
Empty set, 3 warnings (0.01 sec)

mysql> SELECT 
    ->     p.ProductID,
    ->     p.Name,
    ->     SUM(oi.Quantity * p.Price) AS TotalSales
    -> FROM Products p
    -> JOIN OrderItems oi ON p.ProductID = oi.ProductID
    -> GROUP BY p.ProductID, p.Name
    -> ORDER BY TotalSales DESC
    -> LIMIT 1;
+-----------+----------------------+------------+
| ProductID | Name                 | TotalSales |
+-----------+----------------------+------------+
|         2 | Bluetooth Headphones |      79.99 |
+-----------+----------------------+------------+
1 row in set (0.00 sec)

mysql> Select Products.ProductID, Products.Name,  Sum(OrderItems.Quantity * Products.Price) as Sale_product From Products Join OrderItems on  Products.ProductID = OrderItems.ProductID Group by Products.ProductID , Products.Name Order by Sale_product Desc Limit 1;
+-----------+----------------------+--------------+
| ProductID | Name                 | Sale_product |
+-----------+----------------------+--------------+
|         2 | Bluetooth Headphones |        79.99 |
+-----------+----------------------+--------------+
1 row in set (0.00 sec)

mysql> Select * from Products;
+-----------+----------------------+-------------+-------+-------+
| ProductID | Name                 | Category    | Price | Stock |
+-----------+----------------------+-------------+-------+-------+
|         1 | Wireless Mouse       | Electronics | 25.99 |   150 |
|         2 | Bluetooth Headphones | Electronics | 79.99 |   100 |
|         3 | Notebook             | Stationery  |  5.49 |   300 |
+-----------+----------------------+-------------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select * from OrderItems;
+-------------+---------+-----------+----------+
| OrderItemID | OrderID | ProductID | Quantity |
+-------------+---------+-----------+----------+
|           1 |       1 |         1 |        2 |
|           2 |       2 |         2 |        1 |
|           3 |       3 |         3 |        3 |
+-------------+---------+-----------+----------+
3 rows in set (0.00 sec)

mysql> Select * From Products
    -> Where ProductID Not in (Select Distinct ProductID from OrdeItems);
ERROR 1146 (42S02): Table 'sql_intermidiate_level_assignment.OrdeItems' doesn't exist
mysql> Select * From Products Where ProductID Not in (Select Distinct ProductID from OrderItems);
Empty set (0.00 sec)
