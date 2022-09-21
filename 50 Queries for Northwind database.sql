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
WHERE freight >500