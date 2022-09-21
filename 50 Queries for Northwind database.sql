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
WHERE discontinued=1

--9: Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
SELECT 
contactname, 
address,
city
FROM customers
WHERE country NOT IN ('Germany', 'Mexico', 'Spain' )