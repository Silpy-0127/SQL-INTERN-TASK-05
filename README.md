# SQL-INTERN-TASK-05
# 📊 Northwind SQL JOIN Operations in PostgreSQL

This project demonstrates various SQL JOIN operations using the classic Northwind database structure, focusing on the `customers` and `orders` tables.

## 📁 Dataset

The dataset consists of two CSV files:
- `customers.csv`
- `orders.csv`

Both files were cleaned and imported into PostgreSQL using `pgAdmin`.

## 🧱 Database Tables

### 1. customers

| Column         | Data Type |
|----------------|-----------|
| customerid     | VARCHAR (PK) |
| companyname    | VARCHAR |
| contactname    | VARCHAR |
| contacttitle   | VARCHAR |
| address        | VARCHAR |
| city           | VARCHAR |
| region         | VARCHAR |
| postalcode     | VARCHAR |
| country        | VARCHAR |
| phone          | VARCHAR |
| fax            | VARCHAR |

### 2. orders

| Column          | Data Type |
|------------------|-----------|
| orderid          | INT (PK) |
| customerid       | VARCHAR (FK) |
| employeeid       | INT |
| orderdate        | DATE |
| requireddate     | DATE |
| shippeddate      | DATE |
| shipvia          | INT |
| freight          | DECIMAL |
| shipname         | VARCHAR |
| shipaddress      | VARCHAR |
| shipcity         | VARCHAR |
| shipregion       | VARCHAR |
| shippostalcode   | VARCHAR |
| shipcountry      | VARCHAR |

---

## ⚙️ SQL Features Demonstrated

- ✅ `INNER JOIN`
- ✅ `LEFT JOIN`
- ✅ `RIGHT JOIN`
- ✅ `FULL OUTER JOIN`
- ✅ Filtering and aggregation (`GROUP BY`, `COUNT`, `MAX`)
- ✅ Foreign key constraints

---

## 📌 Sample Queries

### 🔸 Inner Join: Customers with orders
```sql
SELECT c.customerid, c.companyname, o.orderid, o.orderdate
FROM customers c
INNER JOIN orders o ON c.customerid = o.customerid;

### 🔸 Left Join: Customers with orders
```sql
SELECT c.customerid, c.companyname, COUNT(o.orderid) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customerid = o.customerid
GROUP BY c.customerid, c.companyname;
