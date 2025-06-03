--Question 1
SELECT *
FROM Products;
--Answer: dbo.Products

--Question 2
SELECT ProductID, ProductName, UnitPrice
FROM Products;

--Question 3
SELECT ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice ASC;

--Question 4
SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitPrice <= 7.5;

--Question 5
SELECT ProductID,ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitsInStock >=100
ORDER BY UnitPrice DESC;

--Question 6
SELECT ProductID,ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitsInStock >=100
ORDER BY UnitPrice DESC, ProductName ASC;

--Question 7
SELECT ProductID, ProductName
FROM Products
WHERE UnitsInStock = 0
    AND UnitsOnOrder > 0
ORDER BY ProductName;

--Question 8
SELECT *
FROM Categories;
--Answer: dbo.Categories

--Question 9
SELECT *
FROM Categories;
--Answer: 8

--Question 10
SELECT *
FROM Products
WHERE CategoryID = 8;

--Question 11
SELECT FirstName, LastName
FROM Employees;

--Question 12
SELECT *
FROM Employees
WHERE Title LIKE '%manager%';

--Question 13
SELECT DISTINCT Title
FROM Employees;

--Question 14
SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary BETWEEN 2000 and 2500;

--Question 15
SELECT *
FROM Suppliers;

--Question 16
SELECT ProductID, ProductName
FROM Products p
JOIN Suppliers s
ON p.SupplierID = s.SupplierID
WHERE p.SupplierID = 4;
