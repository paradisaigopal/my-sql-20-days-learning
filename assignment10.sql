use da8 
CREATE TABLE sales ( sale_id INT PRIMARY KEY, product VARCHAR(50),
category VARCHAR(50), units_sold INT, unit_price INT, region VARCHAR(50)
); 
INSERT INTO sales
(sale_id, product, category, units_sold, unit_price, region)
VALUES
(1, 'Keyboard', 'Electronics', 10, 1200, 'North'),
(2, 'Monitor', 'Electronics', 5, 7000, 'South'),
(3, 'Chair', 'Furniture', 15, 2500, 'North'),
(4, 'Desk', 'Furniture', 7, 4500, 'West'),
(5, 'Mouse', 'Electronics', 20, 800, 'East'),
(6, 'Sofa', 'Furniture', 3, 15000, 'South'),
(7, 'Headphones', 'Electronics', 8, 1800, 'North'),
(8, 'Laptop', 'Electronics', 6, 55000, 'West'),
(9, 'Table', 'Furniture', 12, 6000, 'East'),
(10, 'Fan', 'HomeAppliance', 18, 3000, 'South'),
(11, 'AC', 'HomeAppliance', 4, 35000, 'North'),
(12, 'Cupboard', 'Furniture', 5, 12000, 'West'),
(13, 'Printer', 'Electronics', 9, 9000, 'East'),
(14, 'Bed', 'Furniture', 2, 25000, 'South'),
(15, 'Mobile', 'Electronics', 14, 20000, 'North'); 

select* from sales where category = 'electronics'; 
select* from sales where unit_price > 10000; 
select* from sales where region='north'; 
select* from sales where  units_sold between 5 and 15 
select* from sales where category ='furniture' and unit_price>5000;

select category,sum(units_sold) as total_units_sold from sales group by category having sum(units_sold)>20; 
select region,sum(unit_price * units_sold) as total_revenue from sales group by region having sum(unit_price * units_sold)>50000 
select category,count(*)total_products from sales group by category having count(*)>2; 
select category,avg(unit_price) as average_price from sales geoup by category having avg(unit_price) < 5000; 
SELECT region, COUNT(*) AS Electronics_Count FROM sales WHERE category = 'Electronics' GROUP BY region HAVING COUNT(*) > 1; 

SELECT category,SUM(units_sold) AS Total_Units_Sold FROM sales GROUP BY category ORDER BY Total_Units_Sold DESC; 
SELECT region,AVG(unit_price) AS Average_Unit_Price FROM sales GROUP BY region ORDER BY region ASC; 
SELECT category,SUM(unit_price * units_sold) AS Total_Revenue FROM sales GROUP BY category ORDER BY Total_Revenue DESC; 
SELECT region,COUNT(*) AS Total_Products FROM sales GROUP BY region ORDER BY Total_Products DESC; 
SELECT region,SUM(units_sold) AS Total_Units_Sold FROM sales GROUP BY region ORDER BY region ASC;


SELECT region,SUM(unit_price * units_sold) AS Total_Revenue FROM sales GROUP BY region HAVING SUM(unit_price * units_sold) > 20000 ORDER BY Total_Revenue DESC;
SELECT category,SUM(units_sold) AS Total_Units_Sold FROM sales GROUP BY category HAVING SUM(units_sold) > 10 ORDER BY category ASC; 
SELECT region,COUNT(*) AS Total_Products FROM sales GROUP BY region HAVING COUNT(*) >1 ORDER BY region ASC; 
SELECT category,AVG(unit_price) AS Average_Unit_Price FROM sales GROUP BY category HAVING AVG(unit_price) < 6000 ORDER BY Average_Unit_Price ASC; 


SELECT region,SUM(units_sold) AS Total_Units_Sold FROM sales WHERE category = 'Electronics' GROUP BY region HAVING SUM(units_sold) > 15 ORDER BY Total_Units_Sold DESC; 
SELECT category,SUM(unit_price * units_sold) AS Total_Revenue FROM sales WHERE unit_price > 2000 GROUP BY category HAVING SUM(unit_price * units_sold) > 100000 ORDER BY Total_Revenue DESC; 
SELECT region,AVG(unit_price) AS Average_Unit_Price FROM sales WHERE units_sold >= 5 GROUP BY region HAVING AVG(unit_price) > 5000 ORDER BY region ASC; 
SELECT category,COUNT(*) AS Total_Products FROM sales WHERE region IN ('North', 'South') GROUP BY category HAVING COUNT(*) > 2 ORDER BY Total_Products DESC; 
SELECT region,SUM(unit_price * units_sold) AS Total_Revenue FROM sales WHERE unit_price < 10000 GROUP BY region HAVING SUM(unit_price * units_sold) > 50000 ORDER BY Total_Revenue DESC;