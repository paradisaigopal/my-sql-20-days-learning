 USE DA8;


 SHOW  TABLES;
 DROP TABLE PRODUCTS;
 SELECT*FROM PRODUCTS;
CREATE TABLE Products (
 id INT,
 name VARCHAR(100),
 price DECIMAL(10,2),
 qty INT
 );
INSERT INTO Products VALUES
 (1, 'Pen', 10.00, 100),
 (2, 'Notebook', 25.00, 50),
 (3, 'Pencil', 5.00, 200),
 (4, 'Eraser', 3.00, 300),
 (5, 'Marker', 15.00, 80),
 (6, 'Scale', 20.00, 150),
 (7, 'Sharpener', 8.00, 120),
 (8, 'Geometry Box', 120.00, 40),
 (9, 'Sketch Pen', 60.00, 75),
 (10, 'Crayons', 90.00, 55);
 
 SELECT*FROM PRODUCTS;
 SELECT NAME,PRICE,PRICE+(PRICE*0.12)AS PRICE_WITH_TAX FROM PRODUCTS;
 SELECT NAME,PRICE,PRICE-5 AS DISCOUNTED_PRICE FROM PRODUCTS;
 SELECT NAME,PRICE,QTY,PRICE*QTY AS TOTAL_INVENTORY FROM PRODUCTS;
 SELECT NAME,PRICE,PRICE*10 AS PRICE_PER_10UNITS FROM PRODUCTS;
 SELECT NAME,QTY,QTY%50!=0 AS PRICE_NOT_50 FROM PRODUCTS;
 SET SQL_SAFE_UPADTES=0;
 UPDATE PRODUCTS SET QTY=QTY+2;
 UPDATE PRODUCTS SET PRICE=PRICE-5;
 UPDATE PRODUCTS SET QTY=QTY*2 WHERE NAME = 'ERASER';
 UPDATE PRODUCTS SET QTY=QTY/2 WHERE NAME = 'MARKER';
 DELETE FROM PRODUCTS WHERE QTY<100;
 DELETE FROM PRODUCTS WHERE PRICE<10;
 
 CREATE TABLE StudentScores (
 id INT,
 name VARCHAR(100),
 subject VARCHAR(50),
 marks INT
 );


INSERT INTO StudentScores VALUES
 (1, 'Alice', 'Math', 95),
 (2, 'Bob', 'Math', 76),
 (3, 'Charlie', 'Math', 59),
 (4, 'Diana', 'Math', 88),
 (5, 'Eve', 'Math', 40),
 (6, 'Frank', 'Math', 95),
 (7, 'Grace', 'Science', 67),
 (8, 'Henry', 'Science', 82),
 (9, 'Ivy', 'English', 91),
 (10, 'Jack', 'English', 55),
 (11, 'Kevin', 'Math', 73),
 (12, 'Lily', 'Science', 48),
 (13, 'Mia', 'English', 100),
 (14, 'Noah', 'Math', 64),
 (15, 'Olivia', 'Science', 79);

SELECT*FROM STUDENTSCORES;

SELECT *FROM studentscores where marks>80;
select *from studentscores where marks>=60;
select *from studentscores where marks<50;
select *from studentscores where marks=95;
select *from studentscores where marks!=95;
select *from studentscores where marks<>80;
select *from studentscores where marks<60;

update studentscores set marks=+10 where marks<50;
select *from  studentscores;
update studentscores set marks=+5 where marks<60;


delete from studentscores where marks<50;
delete from studentscores where marks<=60;
delete from studentscores where marks>90;
delete from studentscores where marks>=80;
delete from studentscores where marks!=95;

drop table employees;

CREATE TABLE Employees (
   id INT,
   name VARCHAR(100),
   department VARCHAR(100),
   salary INT,
   isactive BOOLEAN
); 
INSERT INTO employees VALUES
(1, 'Rahul Sharma', 'IT', 50000, TRUE),
(2, 'Priya Reddy', 'HR', 30000, TRUE),
(3, 'Amit Kumar', 'Finance', 45000, FALSE),
(4, 'Sneha Patel', 'IT', 35000, TRUE),
(5, 'Vikram Singh', 'Finance', 28000, TRUE),
(6, 'Anjali Mehta', 'HR', 32000, FALSE),
(7, 'Kiran Rao', 'IT', 60000, TRUE),
(8, 'Pooja Verma', 'Marketing', 27000, TRUE);

select *from employees;
select * from employees where department='it' and salary>40000;
select * from employees where department='hr' or salary<35000;
select * from employees where not department='hr';
select * from employees where department='finance' or (salary>30000 and isactive=1);

update employees set salary=salary+2000 where department='it' and isactive=true and salary<60000; 
update employees set salary=salary-(salary*0.10) where department='finance' or isactive=false;

