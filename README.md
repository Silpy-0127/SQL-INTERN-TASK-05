# 📘 Northwind SQL Joins – Customers & Orders

This project demonstrates SQL JOIN operations on the `customers` and `orders` tables using the Northwind dataset in PostgreSQL.

---

## 📁 Dataset

- `customers.csv`
- `orders.csv`

Imported using **pgAdmin** with cleaned headers and UTF-8 encoding.

---

## 🧱 Tables Created

### ✅ customers
- `customerid` (PK)
- `companyname`, `contactname`, `address`, `city`, `country`, etc.

### ✅ orders
- `orderid` (PK)
- `customerid` (FK to customers)
- `orderdate`, `freight`, `shipcity`, `shipcountry`, etc.

- 🔐 Maintains **relational integrity** via foreign key constraint  
- 📐 Based on a **normalized database design**

---

## 🔄 JOINs Demonstrated

- **INNER JOIN**: Customers with orders  
- **LEFT JOIN**: All customers, with or without orders  
- **RIGHT JOIN**: All orders, even without customer  
- **FULL OUTER JOIN**: All rows from both tables  
- **Aggregations**: `COUNT`, `MAX`, `GROUP BY`

---

## 🛠 How to Run

1. Create `customers` and `orders` tables using the provided SQL
2. Import the CSVs via pgAdmin (UTF-8, comma-separated)
3. Run the queries in `joins.sql` to explore relationships

---

## ⚙️ Tools Used

- PostgreSQL 16
- pgAdmin 4
- SQL (JOINs, aggregates)
- CSV (UTF-8)

---




