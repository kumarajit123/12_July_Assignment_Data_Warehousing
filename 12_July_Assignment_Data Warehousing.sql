TOPIC: Dimensional Modeling and Schemas
   1. Design a star schema for a university database, including a fact table for student enrollments and dimension tables for students, courses, and time. Implement the schema using a database of your choice.
   2. Write SQL queries to retrieve data from the star schema, including aggregations and joins between the fact table and dimension tables.


Solution:- Code 
create table Students
(
Student_id int primary key not null,
Student_gender varchar(10) not null,
Student_DOB date not null,
Student_firstname varchar(100) not null,
Student_lastname varchar(100) not null
);

create table Courses
(
Course_id int primary key not null,
Course_name varchar(100) not null,
Course_duration varchar(10) not null, 
Course_fees    int,
Course_details varchar(100)
);

create table Time
(
 Time_id int primary key not null,
 Am_pm_indicator Time
);

create table Student_enrollments
(
Enrollment_id int primary key not null,
Student_id int,
Course_id int,
Time_id int,
Foreign key(Student_id) references Students(Student_id),
Foreign key(Course_id) references Courses(Course_id),
Foreign key(Time_id) references Time(Time_id),
Enrollment_date Date
);


Insert commands  for table Students

INSERT INTO Students(Student_id, Student_gender, Student_DOB, Student_firstname,Student_lastname)
VALUES (101,'female','1995-04-19','Aaditi','Mishra');

INSERT INTO Students(Student_id, Student_gender, Student_DOB, Student_firstname,Student_lastname)
VALUES (102,'male','1994-05-18','Amrit','sharma');

INSERT INTO Students(Student_id, Student_gender, Student_DOB, Student_firstname,Student_lastname)
VALUES (103,'male','1992-06-12','Ankur','sharma');

INSERT INTO Students(Student_id, Student_gender, Student_DOB, Student_firstname,Student_lastname)
VALUES (104,'female','2000-06-12','Amrita','amrita');

INSERT INTO Students(Student_id, Student_gender, Student_DOB, Student_firstname,Student_lastname)
VALUES (105,'female','2000-05-12','Anita','kapoor');

select * from Students;


Insert commands for table Courses

INSERT INTO Courses(Course_id,Course_name,Course_duration,Course_fees,Course_details)
VALUES (1000,'Big data','9 months',1000000,'Modules');

INSERT INTO Courses(Course_id,Course_name,Course_duration,Course_fees,Course_details)
VALUES (1001,'Data science','8 months',10000,'Modules');

INSERT INTO Courses(Course_id,Course_name,Course_duration,Course_fees,Course_details)
VALUES (1002,'web development','9 months',20000,'Modules');

INSERT INTO Courses(Course_id,Course_name,Course_duration,Course_fees,Course_details)
VALUES (1003,'Java','7 months',20000,'Modules');

INSERT INTO Courses(Course_id,Course_name,Course_duration,Course_fees,Course_details)
VALUES (1004,'DSA','6 months',15000,'Modules');

select * from Courses;

Insert commands for table Time

INSERT INTO Time(Time_id, Am_pm_indicator)
VALUES (400,'03:30:45');

INSERT INTO Time(Time_id, Am_pm_indicator)
VALUES (401,'02:30:45');

INSERT INTO Time(Time_id, Am_pm_indicator)
VALUES (402,'02:30:45');

INSERT INTO Time(Time_id, Am_pm_indicator)
VALUES (403,'03:25:45');

INSERT INTO Time(Time_id, Am_pm_indicator)
VALUES (404,'03:25:45');

select * from Time;


Insert commands for table Student_enrollments

INSERT INTO Student_enrollments(Enrollment_id,Student_id,Course_id,Time_id,Enrollment_date)
VALUES (500,101,1000,400,'2020-04-15');

INSERT INTO Student_enrollments(Enrollment_id,Student_id,Course_id,Time_id,Enrollment_date)
VALUES (501,102,1001,401,'2020-05-15');

INSERT INTO Student_enrollments(Enrollment_id,Student_id,Course_id,Time_id,Enrollment_date)
VALUES (502,103,1002,402,'2020-06-14');

INSERT INTO Student_enrollments(Enrollment_id,Student_id,Course_id,Time_id,Enrollment_date)
VALUES (503,104,1003,403,'2020-07-14');

INSERT INTO Student_enrollments(Enrollment_id,Student_id,Course_id,Time_id,Enrollment_date)
VALUES (504,105,1004,404,'2020-08-14');

select * from Student_enrollments;

SQL Queries

1)

SELECT Student_firstname, Student_lastname
FROM  Students s
INNER JOIN Student_enrollments AS e
ON s.Student_id = e.Student_id 
INNER JOIN Courses AS co
ON e.Course_id = co.Course_id
INNER JOIN Time AS t
ON e.Time_id = t.Time_id
WHERE t.Time_id = 400
ORDER BY Student_lastname;

2)

SELECT Students.Student_firstname, Student_enrollments.Enrollment_date
FROM Students
LEFT JOIN Student_enrollments
ON  Students.Student_id=Student_enrollments.Student_id;


3)

SELECT  Student_enrollments.Enrollment_date,Student_enrollments.Enrollment_id,Students.Student_firstname
FROM Students
Right JOIN Student_enrollments
ON  Students.Student_id=Student_enrollments.Student_id;

4)

SELECT * FROM Students
LEFT JOIN Student_enrollments ON Students.Student_id = Student_enrollments.Student_id
UNION
SELECT * FROM Students
RIGHT JOIN Student_enrollments ON Students.Student_id = Student_enrollments.Student_id;

5)

SELECT 
     MAX(Course_fees) as Maxfeespopularcourse
FROM 
     Courses;
     
6)

SELECT 
     Min(Course_fees) as Minfeescourse
FROM 
     Courses;
     
7)

select Course_name
from Courses
where Course_fees>10000;



TOPIC: Data Warehousing Fundamentals
   1. Design a data warehouse schema for a retail company that includes dimension tables for products, customers, and time. Implement the schema using a relational database management system (RDBMS) of your choice.
   2. Create a fact table that captures sales data, including product ID, customer ID, date, and sales amount. Populate the fact table with sample data.
   3. Write SQL queries to retrieve sales data from the data warehouse, including aggregations and filtering based on different dimensions.


Code

create table Products
(
Product_ID int primary key not null,
Product_Price varchar(10),
Product_manufacture_date Date,
Product_expiry_date Date
);

create table Customers
(
Customer_ID int primary key not null,
Customer_payment_method varchar(10),
purchased_item_name  varchar(10),
Purchased_item_Quantity int
);

create table Time
(
Time_ID int primary key not null,
Day varchar(10),
Opening_time varchar(10),
Closing_time varchar(10)
);

create table Sales_data
(
Sales_ID int primary key not null,
Product_ID int,
Customer_ID int,
Time_ID int,
date Date,
Sales_amount int,
Foreign key(Product_ID) references Products(Product_ID),
Foreign key(Customer_ID) references Customers(Customer_ID),
Foreign key(Time_ID) references Time(Time_ID)
);

Insert commands for table Products

INSERT INTO Products(Product_ID,Product_Price,Product_manufacture_date,Product_expiry_date)
VALUES (600,1000,'2020-04-15','2024-04-14');

INSERT INTO Products(Product_ID,Product_Price,Product_manufacture_date,Product_expiry_date)
VALUES (601,2000,'2020-04-07','2023-04-11');

INSERT INTO Products(Product_ID,Product_Price,Product_manufacture_date,Product_expiry_date)
VALUES (602,3000,'2019-04-07','2023-04-11');

INSERT INTO Products(Product_ID,Product_Price,Product_manufacture_date,Product_expiry_date)
VALUES (603,4000,'2019-04-07','2022-04-11');

INSERT INTO Products(Product_ID,Product_Price,Product_manufacture_date,Product_expiry_date)
VALUES (604,5000,'2018-04-07','2022-04-11');


select * from Products;

Insert commands for table Customers

INSERT INTO Customers(Customer_ID,Customer_payment_method,purchased_item_name,Purchased_item_Quantity)
VALUES (700,'cash','bodywash',1);

INSERT INTO Customers(Customer_ID,Customer_payment_method,purchased_item_name,Purchased_item_Quantity)
VALUES (701,'cash','Facewash',2);

INSERT INTO Customers(Customer_ID,Customer_payment_method,purchased_item_name,Purchased_item_Quantity)
VALUES (702,'card','Micro-oven',1);

INSERT INTO Customers(Customer_ID,Customer_payment_method,purchased_item_name,Purchased_item_Quantity)
VALUES (703,'card','cooler',2);

INSERT INTO Customers(Customer_ID,Customer_payment_method,purchased_item_name,Purchased_item_Quantity)
VALUES (704,'cash','hairdryer',1);

select * from Customers;

Insert commands for table Time

INSERT INTO Time(Time_ID,Day,Opening_time,Closing_time)
VALUES (800,'Monday','8:00Am','8:00Pm');

INSERT INTO Time(Time_ID,Day,Opening_time,Closing_time)
VALUES (801,'Tuesday','8:00Am','8:00Pm');

INSERT INTO Time(Time_ID,Day,Opening_time,Closing_time)
VALUES (802,'wednesday','8:00Am','8:00Pm');

INSERT INTO Time(Time_ID,Day,Opening_time,Closing_time)
VALUES (803,'saturday','10:00Am','5:00Pm');

INSERT INTO Time(Time_ID,Day,Opening_time,Closing_time)
VALUES (804,'sunday','10:00Am','5:00Pm');

select * from Time;

Insert commands for table Sales_data

INSERT INTO Sales_data(Sales_ID,Product_ID,Customer_ID,Time_ID,date,sales_amount)
VALUES (200,600,700,800,'2020-04-12',100000);

INSERT INTO Sales_data(Sales_ID,Product_ID,Customer_ID,Time_ID,date,sales_amount)
VALUES (201,601,701,801,'2020-04-11',200000);

INSERT INTO Sales_data(Sales_ID,Product_ID,Customer_ID,Time_ID,date,sales_amount)
VALUES (202,602,702,802,'2020-04-10',300000);

INSERT INTO Sales_data(Sales_ID,Product_ID,Customer_ID,Time_ID,date,sales_amount)
VALUES (203,603,703,803,'2020-04-14',400000);

INSERT INTO Sales_data(Sales_ID,Product_ID,Customer_ID,Time_ID,date,sales_amount)
VALUES (204,604,704,804,'2020-04-15',500000);

select * from Sales_data;

3. Write SQL queries to retrieve sales data from the data warehouse, including aggregations and filtering based on different dimensions.

A) SELECT Product_Price
   FROM  Products p
  INNER JOIN Sales_data AS s
  ON p.Product_ID = s.Product_ID
  INNER JOIN Customers AS c
  ON s.Customer_id = c.Customer_id
  INNER JOIN Time AS t
  ON s.Time_id = t.Time_id
  WHERE t.Time_id = 800
  ORDER BY Product_Price;
  
B) SELECT Products.Product_manufacture_date, Sales_data.sales_amount
FROM Products
LEFT JOIN Sales_data
ON  Products.Product_ID=Sales_data.Product_ID;


 C) SELECT Products.Product_manufacture_date, Sales_data.sales_amount, Sales_data.date
FROM Products
Right JOIN Sales_data
ON  Products.Product_ID=Sales_data.Product_ID;

D)  SELECT * FROM Products
LEFT JOIN Sales_data ON Products.Product_ID = Sales_data.Product_ID
UNION
SELECT * FROM Products
RIGHT JOIN Sales_data ON Products.Product_ID = Sales_data.Product_ID;

E)  SELECT 
     MAX(Product_Price) as MaxPricemostpurchased
FROM 
     Products;
F) SELECT 
     Min(Product_Price) as MinPriceleastpurchased
FROM 
     Products;

G)  select purchased_item_name
from Customers
where Purchased_item_Quantity>1;
