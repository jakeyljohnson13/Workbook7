--Question 1
SELECT COUNT(*)
FROM Suppliers;
--Answer 29

--Question 2
SELECT SUM(Salary)
FROM Employees;
--Answer: $21020

--Question 3
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM Products);
--Answer: Geitost for $2.50

--Question 4
SELECT AVG(UnitPrice) as Average
FROM Products;
--Answer: $28.87

--Question 5
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products);
--Answer: 263.50

--Question 6
SELECT p.SupplierID, s.CompanyName, COUNT(p.SupplierID) AS [Number of Products Supplied] 
FROM Products p 
JOIN Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY p.SupplierID, s.CompanyName;

--Question 7
SELECT CategoryID, AVG(UnitPrice) AS [Average Price]
FROM Products
GROUP BY CategoryID;

--Question 8
SELECT SupplierID, COUNT(SupplierID) AS [Number of Products Supplied]
FROM Products
GROUP BY SupplierID
HAVING COUNT(SupplierID) >= 5;

--Question 9
SELECT ProductID, ProductName, UnitPrice * UnitsInStock AS [Inventory Value]
FROM Products
GROUP BY ProductID, ProductName, UnitPrice, UnitsInStock
ORDER BY [Inventory Value] DESC, ProductName ASC;
