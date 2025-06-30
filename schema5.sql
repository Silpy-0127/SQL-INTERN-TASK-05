-- ==========================================
-- DROP TABLES IF THEY ALREADY EXIST
-- ==========================================
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- ==========================================
-- CREATE TABLE: CUSTOMERS
-- ==========================================
CREATE TABLE customers (
    customerid VARCHAR PRIMARY KEY,
    companyname VARCHAR,
    contactname VARCHAR,
    contacttitle VARCHAR,
    address VARCHAR,
    city VARCHAR,
    region VARCHAR,
    postalcode VARCHAR,
    country VARCHAR,
    phone VARCHAR,
    fax VARCHAR
);

-- Preview customers table (should return 0 rows until import)
SELECT * FROM customers;

-- ==========================================
-- CREATE TABLE: ORDERS
-- ==========================================
CREATE TABLE orders (
    orderid INT PRIMARY KEY,
    customerid VARCHAR,
    employeeid INT,
    orderdate DATE,
    requireddate DATE,
    shippeddate DATE,
    shipvia INT,
    freight DECIMAL,
    shipname VARCHAR,
    shipaddress VARCHAR,
    shipcity VARCHAR,
    shipregion VARCHAR,
    shippostalcode VARCHAR,
    shipcountry VARCHAR,
    FOREIGN KEY (customerid) REFERENCES customers(customerid)
);

-- Preview orders table (should return 0 rows until import)
SELECT * FROM orders;

-- ==========================================
-- VIEW FIRST 10 RECORDS FROM BOTH TABLES
-- ==========================================
SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;

-- ==========================================
-- INNER JOIN EXAMPLES: Only matching rows from both tables
-- ==========================================

-- Inner Join Example 1: Customers with their order details
SELECT 
    c.customerid,
    c.companyname,
    o.orderid,
    o.orderdate
FROM customers c
INNER JOIN orders o ON c.customerid = o.customerid
ORDER BY o.orderdate
LIMIT 10;

-- Inner Join Example 2: Orders with customer name and country
SELECT 
    o.orderid,
    o.orderdate,
    c.companyname,
    c.country
FROM orders o
INNER JOIN customers c ON o.customerid = c.customerid
ORDER BY o.orderdate DESC
LIMIT 10;

-- ==========================================
-- LEFT JOIN EXAMPLES: All customers, even if they placed no orders
-- ==========================================

-- Left Join Example 1: List all customers and any orders they may have
SELECT 
    c.customerid,
    c.companyname,
    o.orderid,
    o.orderdate
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid
ORDER BY c.customerid
LIMIT 10;

-- Left Join Example 2: Count total orders per customer
SELECT 
    c.customerid,
    c.companyname,
    COUNT(o.orderid) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.companyname
ORDER BY total_orders DESC;

-- Left Join Example 3: Last order date per customer (if any)
SELECT 
    c.customerid,
    c.companyname,
    MAX(o.orderdate) AS last_order_date
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.companyname
ORDER BY last_order_date DESC NULLS LAST;

-- ==========================================
-- RIGHT JOIN EXAMPLES: All orders, even if customer is missing
-- ==========================================

-- Right Join Example 1: Find orders where customer data is missing
SELECT 
    o.orderid,
    o.customerid,
    c.companyname
FROM orders o
RIGHT JOIN customers c ON o.customerid = c.customerid
WHERE c.companyname IS NULL;

-- Right Join Example 2: Orders with optional customer info
SELECT 
    o.orderid,
    o.orderdate,
    c.companyname,
    c.city
FROM orders o
RIGHT JOIN customers c ON o.customerid = c.customerid
ORDER BY o.orderid
LIMIT 10;

-- ==========================================
-- FULL OUTER JOIN EXAMPLES: All customers and all orders, matched or unmatched
-- ==========================================

-- Full Outer Join Example 1: All records from both tables
SELECT 
    c.customerid,
    c.companyname,
    o.orderid,
    o.orderdate
FROM customers c
FULL OUTER JOIN orders o ON c.customerid = o.customerid
ORDER BY c.customerid
LIMIT 10;

-- Full Outer Join Example 2: Only mismatches — customers without orders or orders without customers
SELECT 
    c.customerid,
    o.orderid,
    c.companyname,
    o.orderdate
FROM customers c
FULL OUTER JOIN orders o ON c.customerid = o.customerid
WHERE c.customerid IS NULL OR o.customerid IS NULL;








