--1: Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
SELECT categoryname, description FROM categories
ORDER BY categoryname;

--2: Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
SELECT contactname, companyname, contacttitle, phone 
FROM customers
ORDER BY phone;

--3: Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively and HireDate 
--from the employees table sorted from the newest to the oldest employee.

SELECT 
UPPER(FirstName) AS FirstName,
UPPER(LastName) AS LastName,
hiredate AS HireDate
FROM employees
ORDER BY hiredate DESC;

-- 4: Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order.
SELECT
orderid,
orderdate,
shippeddate,
customerid,
freight
FROM orders
ORDER BY freight DESC
LIMIT 10;

--5: Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
SELECT
LOWER(customerid)
FROM customers;

--6: Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the 
--Country in descending order then by CompanyName in ascending order. no null values to be shown in fax
SELECT 
companyname,
fax,
phone,
country,
homepage
FROM suppliers
WHERE fax IS NOT NULL
ORDER BY country ASC, companyname DESC;

--7: Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only.
SELECT 
companyname, 
contactname
FROM customers
WHERE companyname='Buenos Aires';

--8: Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
SELECT 
productname, 
unitprice,
quantityperunit
FROM products
WHERE discontinued=1;

--9: Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
SELECT 
contactname, 
address,
city
FROM customers
WHERE country NOT IN ('Germany', 'Mexico', 'Spain' );

--10: Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
SELECT
orderdate,
shippeddate,
customerid,
freight
FROM orders
WHERE orderdate='1996-05-21';

--11: Create a report showing FirstName, LastName, Country from the employees not from United States.
SELECT 
firstname,
lastname,
country
FROM employees
WHERE country != 'USA';

--12: Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date.
SELECT
employeeid,
orderid,
customerid,
requireddate,
shippeddate
FROM orders
WHERE shippeddate > requireddate;

-- 13: Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
SELECT 
city,
companyname,
contactname
FROM customers
WHERE city LIKE 'A%'
OR city LIKE 'B%';

-- 14: Create a report showing all the even numbers of OrderID from the orders table.
SELECT *
FROM orders
WHERE orderid % 2 =0;

--15: Create a report that shows all the orders where the freight cost more than $500.
SELECT *
FROM orders
WHERE freight >500;

--16: Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
SELECT 
productname,
unitsinstock,
unitsonorder,
reorderlevel
FROM products
WHERE discontinued = 0
ORDER BY productname;

--17: Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
SELECT 
companyname,
contactname 
FROM customers
WHERE fax IS NULL;

--18. Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
SELECT 
firStname,
lastname
FROM employees
WHERE reportsto IS NULL;

--19. Create a report showing all the odd numbers of OrderID from the orders table.
SELECT * FROM orders
WHERE orderid % 2 !=0;

--20. Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
SELECT
companyname,
contactname,
fax 
FROM customers
WHERE fax IS NULL
ORDER BY contactname;

--21. Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
SELECT 
city,
companyname,
contactname
FROM customers
WHERE city LIKE '%L%'
ORDER BY contactname;

--22. Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
SELECT 
firstname,
lastname,
birthdate 
FROM employees
WHERE EXTRACT(YEAR FROM birthdate)>=1950
AND EXTRACT(YEAR FROM birthdate)<1960;

--23. Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
SELECT 
firstname,
lastname,
EXTRACT(YEAR FROM birthdate) AS "birth year"
FROM employees;

--24. Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order. 
SELECT 
orderid, COUNT(orderid) AS NumberofOrders
FROM order_details
GROUP BY orderid 
ORDER BY COUNT(orderid) DESC;

--25. Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
SELECT 
p.supplierid,
p.productname,
s.companyname
FROM products p
LEFT JOIN suppliers s
ON s.supplierid = p.supplierid 
WHERE companyname IN ('Exotic Liquids', 'Specialty Biscuits, Ltd.','Escargots Nouveaux')
ORDER BY supplierid;

--26. Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124".
SELECT 
shippostalcode,
orderid,
orderdate,
requireddate,
shippeddate,
shipaddress 
FROM orders
WHERE shippostalcode LIKE '98124%';

--27. Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
SELECT 
contactname ,
contacttitle ,
companyname 
FROM customers
WHERE contacttitle NOT LIKE '%Sales%';

--28. Create a report that shows the LastName, FirstName, City of employees in cities other than "Seattle";
SELECT
lastname,
firstname,
city
FROM employees
WHERE city !='Seattle';

--29. Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
SELECT
companyname,
contacttitle,
city,
country
FROM customers
WHERE country IN ('Mexico', 'Spain')
AND city != 'Madrid';


--30. Create a report that shows the firstname, lastname, 'can be reached at', hompehone, and extension of employees in one line 
SELECT CONCAT(
firstname,
' ',
lastname, 
'can be reached at ',
homephone,
' -Ex: ',
"extension") AS contact_info
FROM employees;

--31: Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
SELECT contactname
FROM customers
WHERE contactname NOT LIKE '_a%';

--32. Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and
--maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.

SELECT 
ROUND(AVG(unitprice)) AS AveragePrice,
SUM(unitsinstock) AS TotalStock,
MAX(unitsonorder) AS MaxOrder 
FROM products;

--33. Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table.

SELECT
p.supplierid ,
s.companyname,
c.categoryname,
p.productname,
p.unitprice 
FROM suppliers s 
INNER JOIN products p 
ON p.supplierid = s.supplierid 
INNER JOIN categories c
ON c.categoryid =p.categoryid;

--34. Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped
--by CustomerID. HINT: you will need to use a Groupby and a Having statement.
SELECT 
customerid,
SUM(freight) AS freight
FROM orders
GROUP BY customerid 
HAVING SUM(freight) >200;

--35. Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase.
SELECT
o.orderid ,
c.contactname ,
od.unitprice ,
od.quantity ,
od.discount 
FROM customers c
JOIN orders o
ON o.customerid = c.customerid 
JOIN order_details od
ON od.orderid = o.orderid 
WHERE od.discount > 0;
 
--36. Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of
--who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin.
SELECT
e.employeeid ,
e.lastname || ', ' || e.firstname AS employee,
em.lastname || ', ' || em.firstname AS manager
FROM employees e
LEFT JOIN employees em
ON em.employeeid = e.reportsto 
ORDER BY e.employeeid;

--37. Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively.
SELECT
AVG(unitprice) AS AveragePrice,
MIN(unitprice) AS MinimumPrice,
MAX(unitprice) AS MaximumPrice
FROM products;

--38. Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City,
--Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View.
CREATE VIEW Customerinfo2 AS 
SELECT
c.customerid ,
c.companyname ,
c.contactname ,
c.contacttitle ,
c.address ,
c.city ,
c.country ,
c.phone ,
o.orderdate ,
o.requireddate ,
o.shippeddate 
FROM customers c
JOIN orders o 
ON c.customerid = o.customerid;

--39. Drop the customer details view.
DROP VIEW IF EXISTS customer_details;

--40. Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
SELECT 
SUBSTRING(categoryname, 1, 5) AS shortinfo
FROM categories c;

--41: create a report that shows firstname and lastname as Fullname, Title, and Age of employees from employees table, sort by Age.

SELECT firstname || ' ' || lastname AS Fullname, 
title, 
EXTRACT(YEAR FROM current_date) - EXTRACT(YEAR FROM birthdate)  AS Age
FROM employees  

--42: create a report that shows the group of employees based on the manager they reprot to.
WITH reportingstructure AS 
(
SELECT
e.employeeid ,
e.firstname || ' ' || e.lastname AS employee,
em.firstname || ' ' || em.lastname AS manager
FROM employees e
LEFT JOIN employees em
ON em.employeeid = e.reportsto 
ORDER BY e.employeeid

),

employee_groups AS (
SELECT 
	employeeid,
	CASE WHEN manager = 'Andrew Fuller' THEN 'A'
	ELSE 'B' END AS groups
FROM reportingstructure rs)

SELECT * FROM reportingstructure rs 
NATURAL JOIN employee_groups eg


