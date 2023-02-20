create TABLE employees(
	employee_id int NOT NULL IDENTITY PRIMARY KEY,
	employee_name text,
	employee_age int,
	salary float,
	);
	INSERT INTO employees (employee_name, employee_age, salary)
	VALUES ('John Smith', '32', '55000.50');
	INSERT INTO employees (employee_name, employee_age, salary)
	VALUES ('Sarah Johnson', '28', '48000.75');
	INSERT INTO employees (employee_name, employee_age, salary)
	VALUES ('Michael Brown', '41', '71000.00');
	SELECT * FROM employees;
	UPDATE employees 
	SET salary = 31000.49
	where salary < 55000;
	DELETE FROM employees WHERE salary > 55000.50;
CREATE TABLE students (
	ID INT NOT NULL IDENTITY Primary key,
	Name  text,
	age INT,
	Major text,
	GPA float,
);
ALTER TABLE students
ADD student_email varchar(50);
INSERT INTO students VALUES 
('John Smith','22','Computer Science' ,' 3.8', 'jhon@gmail.com'),
('Sarah Johnson','20','Biology' ,' 3.2', 'sarah@gmail.com'),
(' Michael Brown','24','Business' ,' 3.5', 'michael@gmail.com'),
('Emily Wilson','21','English' ,' 3.9', 'emily@gmail.com'),
('David Lee','23','Psychology' ,' 3.6', 'david@gmail.com');
Select *from students
WHERE GPA > 3.5;
DELETE FROM students WHERE Name like '%david%';
DELETE FROM students WHERE ID = 2;

create TABLE books (
ID int IDENTITY(1,1) PRIMARY KEY,
title text, 
author text,
price float
);
INSERT INTO books VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 10.99), 
('To Kill a Mockingbird', 'Harper Lee', 12.50),
('Pride and Prejudice', 'Jane AUsten', 9.75),
('1984', 'George Orwell', 8.99);
SELECT * FROM books
where price > 10.00;
DROP TABLE books;

create TABLE orders (
	ID INT NOT NULL IDENTITY Primary key,
	product_name text,
	customer_name  text,
	order_date date, 
	quantity  int
);
INSERT INTO orders VALUES
('Widget A', 'John Smith', '2023-02-14', 5),
('Widget B', 'Sarah Johnson', '2023-02-13', 3),
('Widget C', 'Michael Brown', '2023-02-12', 7);
SELECT * FROM orders
where order_date >= '2023-02-13';


create table customers (
	customer_ID int primary key,
	customer_name text, 
	email text,
	phone_number text
);

INSERT INTO customers VALUES 
(1, 'John Smith', 'john.smith@example.com', '555-555-1212'),
(2, 'Jane Doe', 'jane.doe@example.com', '555-555-2323'),
(3, 'Bob Brown', 'bob.brown@example.com', '555-555-3434');
SELECT * FROM customers;

CREATE TABLE product(
	product_id INT PRIMARY KEY,
	product_name text,
	category text,
	price decimal,
	quantity_in_stock int,
);

INSERT INTO product VALUES 
(1,'iPhone','Electronics',999.99,100),
(2,'Samsung Galaxy','Electronics', 799.99,50),
(3,'Nike Air Max','Electronics',119.99,200);
SELECT * FROM product;
SELECT product_id, product_name,price from product ORDER BY price DESC;

CREATE TABLE movies(
  movie_id int primary key,
  movie_title text,
  director text,
  genre text,
  release_year int,
);
INSERT INTO movies VALUES 
(1,'The Shawshank Redemption','Frank Darabont','Drama',1994),
(2,'The Godfather','Francis Ford Coppola','Drama',1972),
(3,'The Dark Knight','Christopher Nolan','Action',2008);
SELECT * FROM movies;
SELECT movie_id,movie_title , director from movies where genre like 'Drama' ;


CREATE TABLE inventory(
  product_id int  primary key ,
  product_name text,
  supplier text,
  category text,
  quantity int,
  price real,
);
INSERT INTO inventory VALUES (1,'iPhone 13','Apple Inc','Electronics',10,999.99),
(2,'Kindle Paperwhite','Amazon','Books & Media',20,129.99),
(3,'Nike Air Max 90','Nike Inc','Apparel',5,119.99);
SELECT * FROM inventory;
SELECT product_id , product_name , price FROM inventory where quantity > =10 ;
SELECT * FROM inventory where price = 5 ;


CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  sale_date DATE,
  sale_amount DECIMAL(10,2)
);

INSERT INTO sales ( sale_id,sale_date, sale_amount)
VALUES
  (1,'2022-01-01', 100.00),
  (2,'2022-01-02', 50.00),
  (3,'2022-01-15', 75.00),
  (4,'2022-02-01', 200.00),
  (5,'2022-02-05', 150.00),
  (6,'2022-02-20', 175.00);
SELECT * FROM sales;
SELECT month(sale_date) AS month, SUM(sale_amount) AS total_sales FROM sales GROUP BY MONTH(sale_date) ORDER BY MONTH(sale_date);
SELECT AVG(sale_amount) AS avg_sales FROM sales;
SELECT COUNT (sale_id) AS "Products sold" FROM sales;
SELECT MIN(sale_amount) AS "lowest amount", MAX(sale_amount) AS "highest amount" FROM sales;
SELECT * FROM sales ORDER BY sale_id DESC;
SELECT * FROM sales WHERE sale_date BETWEEN '2022-01-01' AND '2022-02-01';