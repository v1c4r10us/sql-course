-- 1.
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Suppliers;

-- 2.
SELECT * FROM Customers ORDER BY Country, ContactName;

-- 3. 
SELECT * FROM Orders ORDER BY OrderDate;

-- 4.
SELECT COUNT(*) AS Qty_Orders_1997 FROM Orders WHERE YEAR(OrderDate)=1997;

-- 5. 
SELECT ContactName, ContactTitle FROM Customers WHERE ContactTitle LIKE '%anager%' ORDER BY ContactName;

-- 6.
SELECT * FROM Orders WHERE YEAR(OrderDate)=1997 AND MONTH(OrderDate)=5 AND DAY(OrderDate)=19;

-- 7.
SELECT * FROM Employees WHERE EmployeeID IN (3,5,8);

-- 8.
SELECT * FROM Products WHERE UnitsInStock>20 AND SupplierID IN(1,3,5) 

-- 9.
SELECT * FROM Products WHERE UnitPrice BETWEEN 20 AND 90

-- 10.
-- SET DATEFORMAT ymd       
SELECT * FROM Orders WHERE OrderDate BETWEEN '1997-01-01' AND '1997-07-15'

-- 11.
SELECT * FROM Orders WHERE (OrderDate BETWEEN '1997-01-01' AND '1997-07-15')  AND (EmployeeID IN (1,3,4,8))

-- 12.
SELECT * FROM Orders WHERE YEAR(OrderDate)='1997' AND MONTH(OrderDate)='4'

-- 13.
SELECT * FROM Orders WHERE DAY(OrderDate)='1' AND YEAR(OrderDate)='1998'

-- 14.
SELECT * FROM Customers WHERE Fax IS NULL

-- 15.
SELECT * FROM Customers WHERE Fax IS NOT NULL 

-- 16.
SELECT ProductName,UnitPrice,UnitsInStock,CategoryName 
FROM Products 
INNER JOIN Categories ON Categories.CategoryID=Products.CategoryID 

-- 17.
SELECT P.ProductName,P.UnitPrice,P.SupplierID,S.CompanyName       
FROM Products AS P       
INNER JOIN Suppliers AS S 
ON S.SupplierID=P.SupplierID 

-- 18. 
SELECT O.OrderID,OrderDate,ProductID,UnitPrice, O.EmployeeID,(lastname+' '+FirstName) AS NoombreCompleto     
FROM Orders AS O         
INNER JOIN [Order Details] AS D           
ON O.OrderID=D.OrderID         
INNER JOIN Employees AS E     
ON E.EmployeeID=O.EmployeeID

-- 19.
SELECT TOP 10 * FROM Products ORDER BY UnitsInStock 

-- 20.
SELECT TOP 10 * FROM Products ORDER BY UnitsInStock DESC

-- 21.
SELECT TOP 10 * FROM Products ORDER BY UnitPrice

-- 22.
SELECT TOP 10 * FROM Products ORDER BY UnitPrice DESC

-- 23.
SELECT e.City AS City, COUNT(DISTINCT e.EmployeeID) AS [Number of Employees], COUNT(DISTINCT c.CustomerID) AS [Number of Customers]
FROM Employees e 
LEFT JOIN Customers c ON e.City = c.City
GROUP BY e.City
ORDER BY City;

-- 24.
SELECT c.City AS City, COUNT(DISTINCT c.CustomerID) AS [Number of Customers], COUNT(DISTINCT e.EmployeeID) AS [Number of Employees] 
FROM Employees e 
RIGHT JOIN Customers c ON e.City = c.City
GROUP BY c.City
ORDER BY City;

-- 25.
SELECT
	ISNULL (e.City,	c.City) AS [City],
	COUNT(DISTINCT e.EmployeeID) AS [Number of Employees],
	COUNT(DISTINCT c.CustomerID) AS [Number of Customers]
FROM Employees e 
FULL JOIN Customers c ON e.City = c.City
GROUP BY e.City, c.City
ORDER BY [City];

-- 26.
SELECT o.OrderID, e.LastName, e.FirstName
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
AND o.ShippedDate > o.RequiredDate;

-- 27.
SELECT o.ProductID, p.ProductName, SUM(o.Quantity) AS [Total Quantity]
FROM [Order Details] o
JOIN Products p ON p.ProductID = o.ProductID
GROUP BY o.ProductID, p.ProductName
HAVING SUM(o.Quantity) < 200
ORDER BY [Total Quantity] DESC;

-- 28.
SELECT CustomerID, COUNT(OrderID) AS [Total Number of Orders]
FROM Orders
WHERE OrderDate > '1996-12-31'
GROUP BY CustomerID
HAVING COUNT(OrderID) > 15
ORDER BY [Total Number of Orders];

-- 29.
SELECT SUM(([Order Details].UnitPrice)* [Order Details].Quantity * (1.0-[Order Details].Discount)) AS [1997 Total Revenues]
FROM [Order Details]
INNER JOIN (SELECT OrderID FROM Orders WHERE YEAR(OrderDate) = '1997') AS Ord 
ON Ord.OrderID = [Order Details].OrderID

-- 30.
SELECT Customers.CompanyName, SUM([Order Details].UnitPrice * [Order Details].Quantity * (1.0- [Order Details].Discount)) AS [Total]
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
GROUP BY Customers.CompanyName
ORDER BY [Total] DESC;

-- 31.
SELECT Products.ProductName, SUM([Order Details].UnitPrice * [Order Details].Quantity * (1.0- [Order Details].Discount)) AS [Sales]
FROM Products
INNER JOIN [Order Details]
ON [Order Details].ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY [Sales] DESC;

-- 32.
SELECT Customers.ContactName, SUM([Order Details].UnitPrice * [Order Details].Quantity * (1.0- [Order Details].Discount)*100)/100 AS [Payments]
FROM Customers
INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
WHERE Customers.Country = 'UK'
GROUP BY Customers.ContactName
HAVING SUM([Order Details].UnitPrice * [Order Details].Quantity * (1.0- [Order Details].Discount)) > 1000;

-- 33.
SELECT Customers.CustomerID, Customers.CompanyName, Customers.Country, ISNULL(SUM([Order Subtotals].Subtotal), 0) AS [Customer Total], ISNULL(SUM(CONVERT(money, [1997].Payments/100)*100),0) AS [1997]
FROM Customers
LEFT JOIN Orders ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
LEFT JOIN [Order Subtotals] ON [Order Subtotals].OrderID = Orders.OrderID
LEFT JOIN (SELECT Customers.CustomerID, Customers.CompanyName, Customers.Country, ([Order Details].UnitPrice * [Order Details].Quantity * (1.0- [Order Details].Discount)) AS [Payments]
			FROM Customers
			INNER JOIN Orders ON Orders.CustomerID = Customers.CustomerID
			INNER JOIN [Order Details] ON [Order Details].OrderID = Orders.OrderID
			WHERE YEAR(Orders.OrderDate) = '1997') AS [1997] 
ON [1997].CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.CompanyName, Customers.Country
ORDER BY [Customer Total]