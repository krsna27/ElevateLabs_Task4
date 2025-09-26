# Ecommerce Database SQL Analysis

## 📌 Project Overview
This project involved *creating and analyzing an Ecommerce database* using SQL. The goal was to learn and demonstrate data manipulation, querying, aggregation, joining, and analysis of structured data from multiple related tables. The dataset was created from scratch with 15 entries in each table.

---

## 🛠 Tools Used
- *Database:* MySQL  
- *Querying & Analysis:* SQL (SELECT, WHERE, JOIN, GROUP BY, ORDER BY, subqueries, views)  
- *Data Storage:* SQL tables  
- *Optional:* MySQL Workbench / DBeaver for executing queries and taking screenshots  

---

## 📂 Database Schema
The database Ecommerce contains the following tables:

1. *City* – Stores city names and countries.  
2. *Customer* – Stores customer details with a foreign key to City.  
3. *Category* – Stores product categories.  
4. *Product* – Stores product details with a foreign key to Category.  
5. *Orders* – Stores order details with a foreign key to Customer.  
6. *OrderedProduct* – Stores ordered products with foreign keys to Orders and Product.  
7. *Review* – Stores customer reviews with foreign keys to Customer and Product.

---

## 📥 Data Insertion
- 15 entries were inserted into each table.  
- Sample entries included customers from multiple countries, products from different categories, and various orders and reviews.

---

## 📝 SQL Analysis Performed
The following steps were performed for data analysis:

1. *Preview Data*  
   - Checked first few rows of all tables to verify insertion.

2. *Basic SELECT Queries*  
   - Retrieved customers with their city names.  
   - Retrieved products with their category names and prices.

3. *Filtering Data (WHERE)*  
   - Filtered customers based on city.  
   - Filtered products above a certain price.

4. *Sorting Data (ORDER BY)*  
   - Sorted products by price.  
   - Sorted orders by order date.

5. *Aggregation (GROUP BY & Aggregate Functions)*  
   - Calculated total sales per product.  
   - Calculated average rating per product.  
   - Counted number of orders per customer.

6. *Joins (INNER & LEFT)*  
   - Listed orders with customer names, product names, quantity, and price.  
   - Listed all customers with or without orders using LEFT JOIN.

7. *Subqueries*  
   - Identified customers who spent more than the average order total.  
   - Found products that were never ordered.

8. *Views*  
   - Created CustomerOrderSummary view to summarize total orders and spending per customer.

9. *Indexes for Optimization*  
   - Added indexes on frequently joined columns (Customer.CityID, Product.CategoryID, Orders.CustomerID, OrderedProduct.OrderID, OrderedProduct.ProductID).

---

## 📊 Outcome
- Successfully *analyzed customer, product, order, and review data* using SQL queries.  
- Learned *JOIN operations, aggregation, subqueries, and views* for better insights.  
- Created a *structured SQL workflow* that can be reused for other datasets.  

---

## 📂 Deliverables
1. SQL file: Ecommerce_Analysis.sql containing all queries with comments.  
2. Screenshots of query results (optional for GitHub display).  

---

## ✅ Task Completion
The SQL analysis task was *successfully completed*, demonstrating the ability to manipulate, query, and analyze structured data from a relational database.