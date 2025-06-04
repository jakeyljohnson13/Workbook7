--Question 1
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

--Question 2
select OrderID, ShipName, ShipAddress
FROM Orders
WHERE ShipVia = (Select ShipperID
                FROM Shippers
                WHERE CompanyName like '%Federal%');

--Question 3
select OrderID 
from [Order Details]
where ProductID = (select ProductID
                    from Products
                    where ProductName like '%Sasquatch%');

--Question 4
select FirstName, LastName
from Employees
where EmployeeID = (select EmployeeID
                    from Orders
                    where OrderID = 10266);

--Question 5
SELECT ContactName
FROM Customers
WHERE CustomerID IN (Select CustomerID
                    from Orders
                    where OrderID = 10266);