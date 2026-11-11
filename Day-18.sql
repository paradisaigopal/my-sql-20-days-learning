use da8;
CREATE DATABASE companydb;

USE companydb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    experience INT,
    city VARCHAR(50),
    age INT
);

INSERT INTO employees
VALUES
(101, 'Ravi', 'IT', 45000, 2, 'Hyderabad', 24),
(102, 'Kiran', 'HR', 40000, 3, 'Vijayawada', 27),
(103, 'Suresh', 'IT', 55000, 5, 'Hyderabad', 30),
(104, 'Anil', 'Sales', 35000, 1, 'Chennai', 23),
(105, 'Priya', 'Finance', 60000, 6, 'Bangalore', 32),
(106, 'Sneha', 'IT', 50000, 4, 'Vizag', 28),
(107, 'Rahul', 'HR', 42000, 2, 'Hyderabad', 25),
(108, 'Arjun', 'Sales', 38000, 3, 'Chennai', 26),
(109, 'Divya', 'Finance', 65000, 7, 'Bangalore', 34),
(110, 'Manoj', 'IT', 70000, 8, 'Hyderabad', 35);

SELECT*FROM EMPLOYEES;

DELIMITER //

CREATE PROCEDURE GetITEmployees()
BEGIN
    SELECT *
    FROM employees
    WHERE department = 'IT';
END //

DELIMITER ;

CALL GetITEmployees(); 

select* from employees where experience>5; 

DELIMITER //

CREATE PROCEDURE gitexperiences()
BEGIN
    SELECT *
    FROM employees
    WHERE experience>5;
END //

DELIMITER ;

CALL gitexperiences();  

DELIMITER //

CREATE PROCEDURE getemployeesbydepartment(in dept varchar(20))
BEGIN
    SELECT *
    FROM employees
    WHERE department=dept;
END //

DELIMITER ;

CALL getemployeesbydepartment('hr');  

DELIMITER //

CREATE PROCEDURE getemployeesbysalary(in sal decimal(10,2))
BEGIN
    SELECT *
    FROM employees
    WHERE salary=sal;
END //

DELIMITER ;

CALL getemployeesbysalary(60000);  

delimiter //

create procedure incrementbyexperience(in exp int,in sal decimal(10,2))
begin
update employees set salary=salary+sal where experience>exp;
end //
delimiter ; 
set sql_safe_updates=0;
call incrementbyexperience(6,20000);
select *from employees;
									
delimiter //

CREATE PROCEDURE GETEMPLOYEESBYSALARYRANGE(IN MIN_SAL DECIMAL(10,2),IN MAX_SAL DECIMAL(10,2))
BEGIN
SELECT*FROM EMPLOYEES WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;
END //
DELIMITER ;
CALL GETEMPLOYEESBYSALARYRANGE(20000, 50000);
 
SELECT*FROM EMPLOYEES WHERE EMP_ID=101;
delimiter //

create procedure totalitemployees(out cnt int)
begin
select count(*) into cnt from employees where department='it' ;
end //
delimiter ;
call totalitemployees(@c);
select @c; 

SELECT*FROM EMPLOYEES WHERE EMP_ID=101;
delimiter //
create procedure addbonus(in empid int,inout bonus decimal(10,2))
begin
update employees set salary=salary+bonus where emp_id=empid;

select salary into bonus from employees where emp_id=empid;
end // 
delimiter ;
set @8=5000;
call addbonus(101,@b);
select @b;
drop procedure addbonus;

use companydb;
drop table employees;


CREATE TABLE Employees (
	emp_id INT PRIMARY KEY,
	emp_name VARCHAR(50),
	department VARCHAR(30),
	salary DECIMAL(10,2),
	experience INT,
	city VARCHAR(30)
);
 
INSERT INTO Employees VALUES
(101,'Rahul','IT',65000,5,'Hyderabad'),
(102,'Priya','HR',45000,3,'Chennai'),
(103,'Amit','Finance',70000,6,'Bangalore'),
(104,'Sneha','IT',80000,8,'Hyderabad'),
(105,'Kiran','Sales',40000,2,'Pune');


CREATE TABLE Employee_Audit(
	audit_id INT AUTO_INCREMENT PRIMARY KEY,
	emp_id INT,
	action_type VARCHAR(20),
	old_salary DECIMAL(10,2),
	new_salary DECIMAL(10,2),
	action_time DATETIME
);

select*from employees;
select*from employee_audit; 



delimiter //
create trigger trg_before_insert_salary
before insert
on employees
for each row
begin
	if new.salary<20000 then
    signal sqlstate '45000'
    set message_text='salary cannot be less than 20000';
    end if;
    end //
    delimiter ;
    insert into employees values(106,'mahesh','sales',25000,1,'hyd');
drop table employee_audit;
delimiter //
create trigger trg_after_insert
after insert
on employees
for each row
begin
	insert into employee_audit(emp_id,action_type,new_salary,action_time)
    values(new.emp_id,'insert',new.salary,now());
    end //
    delimiter ;
    insert into employees values(107,'kavya','hr',55000,4,'chennai');
    select* from employee_audit;
    
    drop trigger trg_after_insert

delimiter //
create trigger trg_before_update_salary
before update
on employees
for each row
begin
if new.salary<old.salary then
signal sqlstate '45000'
set message_text='salary cannot be reduced';
end if;
end //
delimiter ;

update employees set salary=50000 where emp_id=102;
select * from employees; 

delimiter //
create trigger trg_after_update
after update
on employees
for each row
begin
	insert into employee_audit(emp_id,action_type,old_salary,new_salary,action_time)
    values(new.emp_id,'update',old.salary,new.salary,now());
    end //
    delimiter ;
    update employees set salary=60000 where emp_id=107;
    select* from employee_audit;
    drop trigger trg_after_update
drop trigger trg_before_delete_employee

delimiter //
create trigger trg_before_delete_employee
before delete
on employees
for each row
begin
if old.department='it' then
signal sqlstate '45000'
set message_text='cannot delete it employees';
end if;
end //
delimiter ;
delete from employees where emp_id=101;
select * from employees;
drop trigger trg_after_delete
delimiter //
create trigger trg_after_delete
after delete
on employees
for each row
begin
	insert into employee_audit(emp_id,action_type,old_salary,action_time)
    values(old.emp_id,'delete',old.salary,now());
    end //
    delimiter ;
   delete from employees where emp_id=103;
select *from employee_audit;


drop table employees;
