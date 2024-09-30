-- Query to get all the details from the person table including email ID, phone number, and phone number type

SELECT p.*, e.EmailAddress, ph.PhoneNumber, pt.Name AS PhoneNumberType
FROM Person.Person AS p
LEFT JOIN Person.EmailAddress AS e ON p.BusinessEntityID = e.BusinessEntityID
LEFT JOIN Person.PersonPhone AS ph ON p.BusinessEntityID = ph.BusinessEntityID -- Aliasing Person.PersonPhone as ph
LEFT JOIN Person.PhoneNumberType AS pt ON ph.PhoneNumberTypeID = pt.PhoneNumberTypeID;

-- Query to get the details of the sales header order made in May 2011

SELECT *
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5;

-- Query to get the details of the sales details order made in the month of May 2011

SELECT sod.*
FROM Sales.SalesOrderDetail AS sod
JOIN Sales.SalesOrderHeader AS soh ON sod.SalesOrderID = soh.SalesOrderID
WHERE YEAR(soh.OrderDate) = 2011 AND MONTH(soh.OrderDate) = 5;

-- Query to get the total sales made in May 2011

SELECT SUM(TotalDue) AS TotalSalesMay2011
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5;

-- Query to get the total sales made in the year 2011 by month order by increasing sales

SELECT YEAR(OrderDate) AS SalesYear, MONTH(OrderDate) AS SalesMonth, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate), MONTH(OrderDate);

-- Query to get the total sales made to the customer with FirstName='Gustavo' and LastName='Achong'

SELECT p.FirstName, p.LastName, SUM(soh.TotalDue) AS TotalSalesToGustavoAchong
FROM Person.Person AS p
JOIN Sales.Customer AS c ON p.BusinessEntityID = c.PersonID
JOIN Sales.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID
WHERE p.FirstName = 'Gustavo' AND p.LastName = 'Achong'
GROUP BY p.FirstName, p.LastName;


