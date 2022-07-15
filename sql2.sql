--Question 2

CREATE TABLE manufacturer(
	Manufr_id INT PRIMARY KEY,
	Manufr_name VARCHAR(20)
)

CREATE TABLE product(
	Product_id INT PRIMARY KEY,
	Manufacture_date DATE,
	Product_name VARCHAR(25),
	Manufr_id INT
)


CREATE TABLE orderDetails(
	OrderId INT PRIMARY KEY,
	OrderDate DATE,
	OrderPrice INT,
	OrderQuantity INT
)

CREATE TABLE customer(
	CustomerId INT IDENTITY PRIMARY KEY,
	CustomerName VARCHAR(25), 
	OrderId INT, 
)

CREATE TABLE idPO(
	Product_id INT,
	OrderId INT
)


INSERT INTO manufacturer VALUES
(1, 'Samsung'),
(2, 'Sony'),
(3, 'Mi'),
(4, 'Boat')

INSERT INTO product VALUES
(145, '2019-12-23', 'MobilePhone', 1),
(147, '2019-08-15', 'MobilePhone', 3),
(435, '2018-11-04', 'MobilePhone', 1),
(783, '2017-11-03', 'LED TV', 2),
(784, '2019-11-28', 'LED TV', 2),
(123, '2019-10-03', 'Laptop', 2),
(267, '2019-11-03', 'Headphone', 4),
(333, '2017-12-12', 'Laptop', 1),
(344, '2018-11-03', 'Laptop', 1),
(233, '2019-11-30', 'PowerBank',2),
(567, '2019-09-03', 'PowerBank', 2)

INSERT INTO orderDetails VALUES
(1, '2020-12-22', 270, 2),
(2, '2019-08-10', 280, 4),
(3, '2019-07-13', 600, 5),
(4, '2020-07-15', 520, 1),
(5, '2020-12-22', 1200, 4),
(6, '2019-10-02', 720, 3),
(7, '2020-11-03', 3000, 2),
(8, '2020-12-22', 1100, 4),
(9, '2019-12-29', 5500, 2)

INSERT INTO customer VALUES
('Jayesh', 1),
('Abhilash', 2),
('Lily', 3),
('Jayesh', 4),
('Aswathy', 5),
('Jayesh', 6),
('Lily', 7),
('Aswathy', 8),
('Jayesh', 9)

INSERT INTO idPO VALUES
(145, 2),
(147, 6),
(435, 5),
(783, 1),
(784, 4 ),
(123, 2),
(267, 5),
(333, 9),
(344, 3),
(233, 3),
(567, 6)

--1) Total number of orders placed in each yearSELECT YEAR(OrderDate) AS year,
SUM(OrderQuantity) AS orders
FROM orderDetails
GROUP BY YEAR(OrderDate)

--2) Total number of orders placed in each year by Jayesh
SELECT YEAR(OrderDate) AS year,
SUM(OrderQuantity) AS orders
FROM orderDetails
INNER JOIN customer ON customer.OrderId = orderDetails.OrderId
WHERE customer.CustomerName = 'Jayesh'
GROUP BY YEAR(OrderDate)

--3) Products which are ordered in the same year of its manufacturing year
SELECT product.Product_id,Product_name FROM product
INNER JOIN idPO ON idPO.Product_id = product.Product_id
INNER JOIN orderDetails ON orderDetails.OrderId = idPO.OrderId
WHERE YEAR(orderDetails.OrderDate) = YEAR(product.Manufacture_date)

--4) Products which is ordered in the same year of its manufacturing year where the
--Manufacturer is ‘Samsung’
SELECT product.Product_id,Product_name FROM product
INNER JOIN idPO ON idPO.Product_id = product.Product_id
INNER JOIN orderDetails ON orderDetails.OrderId = idPO.OrderId
WHERE YEAR(orderDetails.OrderDate) = YEAR(product.Manufacture_date)
AND product.Manufr_id = 1

--5) Total number of products ordered every year
SELECT SUM(OrderQuantity) AS no_of_products, YEAR(OrderDate) AS YearOrdered FROM orderDetails
GROUP BY YEAR(OrderDate)

--6) Display the total number of products ordered every year made by sony
SELECT SUM(OrderQuantity) AS no_of_products, YEAR(OrderDate) AS YearOrdered FROM orderDetails
INNER JOIN idPO ON idPO.OrderId = orderDetails.OrderId
INNER JOIN product ON product.Product_id = idPO.Product_id
WHERE product.Manufr_id = 2
GROUP BY YEAR(OrderDate)

--7) All customers who are ordering mobile phone by samsung
SELECT CustomerName FROM customer
INNER JOIN idPO ON idPO.OrderId = customer.OrderId
INNER JOIN product ON product.Product_id = idPO.Product_id
WHERE product.Manufr_id = 1 AND product.Product_name  = 'MobilePhone'

--8) Total number of orders got by each Manufacturer every year
SELECT manufacturer.Manufr_name, YEAR(orderDetails.OrderDate), COUNT(*) AS OrderCount
FROM orderDetails
INNER JOIN idPO ON idPO.OrderId = orderDetails.OrderId
INNER JOIN product ON product.Product_id = idPO.Product_id
INNER JOIN manufacturer ON product.Manufr_id = manufacturer.Manufr_id
GROUP BY manufacturer.Manufr_name, YEAR(orderDetails.OrderDate)

--9) All Manufacturers whose products were sold more than 1500 Rs every year
SELECT manufacturer.Manufr_name, YEAR(orderDetails.OrderDate)
FROM orderDetails
INNER JOIN idPO ON idPO.OrderId = orderDetails.OrderId
INNER JOIN product ON product.Product_id = idPO.Product_id
INNER JOIN manufacturer ON product.Manufr_id = manufacturer.Manufr_id
GROUP BY manufacturer.Manufr_name, YEAR(orderDetails.OrderDate)
HAVING SUM(orderDetails.OrderPrice)>1500
