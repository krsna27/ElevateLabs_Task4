-- ===============================================
-- Ecommerce Database Analysis Queries
-- Database: Ecommerce_DB
-- Description: SQL queries for Task 4 - Data Analysis
-- ===============================================

-- CREATION OF ECOMMERCE DATABASE SCHEMA

CREATE DATABASE Ecommerce;

USE Ecommerce;

-- 1. City Table
CREATE TABLE City (
    CityID INT AUTO_INCREMENT PRIMARY KEY,
    CityName VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL
);

-- 2. Customer Table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Contact VARCHAR(20),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

-- 3. Category Table
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

-- 4. Product Table
CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

-- 5. Orders Table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(12,2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- 6. OrderedProduct Table
CREATE TABLE OrderedProduct (
    OrderProductID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- 7. Review Table
CREATE TABLE Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewText TEXT,
    ReviewDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

-- INSERTION QUERIES 

-- Insert into City
INSERT INTO City (CityName, Country) VALUES
('Mumbai', 'India'),
('Delhi', 'India'),
('Bangalore', 'India'),
('New York', 'USA'),
('San Francisco', 'USA'),
('London', 'UK'),
('Manchester', 'UK'),
('Sydney', 'Australia'),
('Melbourne', 'Australia'),
('Toronto', 'Canada'),
('Vancouver', 'Canada'),
('Paris', 'France'),
('Berlin', 'Germany'),
('Tokyo', 'Japan'),
('Singapore', 'Singapore');

-- Insert into Customer
INSERT INTO Customer (FirstName, LastName, Email, Password, Contact, CityID) VALUES
('Raj', 'Sharma', 'raj@example.com', 'pass123', '9876543210', 1),
('Priya', 'Mehta', 'priya@example.com', 'pass123', '9988776655', 2),
('Amit', 'Kumar', 'amit@example.com', 'pass123', '9123456780', 3),
('John', 'Doe', 'john@example.com', 'pass123', '8765432109', 4),
('Jane', 'Smith', 'jane@example.com', 'pass123', '7654321098', 5),
('Robert', 'Brown', 'robert@example.com', 'pass123', '6543210987', 6),
('Emily', 'Jones', 'emily@example.com', 'pass123', '5432109876', 7),
('Chris', 'Taylor', 'chris@example.com', 'pass123', '4321098765', 8),
('Olivia', 'Wilson', 'olivia@example.com', 'pass123', '3210987654', 9),
('Liam', 'Martin', 'liam@example.com', 'pass123', '2109876543', 10),
('Sophia', 'Lee', 'sophia@example.com', 'pass123', '1098765432', 11),
('Lucas', 'White', 'lucas@example.com', 'pass123', '9988771122', 12),
('Isabella', 'Harris', 'isabella@example.com', 'pass123', '8899776655', 13),
('Noah', 'Clark', 'noah@example.com', 'pass123', '7788665544', 14),
('Mia', 'Hall', 'mia@example.com', 'pass123', '6677554433', 15);

-- Insert into Category
INSERT INTO Category (CategoryName) VALUES
('Electronics'),
('Clothing'),
('Footwear'),
('Accessories'),
('Home Appliances'),
('Books'),
('Sports'),
('Beauty'),
('Toys'),
('Groceries'),
('Furniture'),
('Jewelry'),
('Gaming'),
('Stationery'),
('Automobile');

-- Insert into Product
INSERT INTO Product (ProductName, Price, CategoryID) VALUES
('iPhone 14', 79999, 1),
('Samsung TV', 55000, 5),
('Nike Sneakers', 7500, 3),
('Levi''s Jeans', 2500, 2),
('Rolex Watch', 500000, 12),
('Adidas T-Shirt', 1500, 2),
('Sony Headphones', 8000, 1),
('Cricket Bat', 3500, 7),
('Dining Table', 12000, 11),
('Harry Potter Book', 999, 6),
('PlayStation 5', 55000, 13),
('Sketchbook', 250, 14),
('Perfume Bottle', 4000, 8),
('Toy Car', 1200, 9),
('Rice Bag 10kg', 650, 10);

-- Insert into Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2025-01-10', 79999),
(2, '2025-01-15', 7500),
(3, '2025-02-01', 2500),
(4, '2025-02-10', 55000),
(5, '2025-02-15', 500000),
(6, '2025-03-01', 1500),
(7, '2025-03-05', 8000),
(8, '2025-03-07', 3500),
(9, '2025-03-10', 12000),
(10, '2025-03-12', 999),
(11, '2025-03-15', 55000),
(12, '2025-03-20', 250),
(13, '2025-03-25', 4000),
(14, '2025-04-01', 1200),
(15, '2025-04-05', 650);


-- Insert into OrderedProduct
INSERT INTO OrderedProduct (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 79999),
(2, 3, 1, 7500),
(3, 4, 1, 2500),
(4, 2, 1, 55000),
(5, 5, 1, 500000),
(6, 6, 1, 1500),
(7, 7, 1, 8000),
(8, 8, 1, 3500),
(9, 9, 1, 12000),
(10, 10, 1, 999),
(11, 11, 1, 55000),
(12, 12, 1, 250),
(13, 13, 1, 4000),
(14, 14, 1, 1200),
(15, 15, 1, 650);

-- Insert into Review
INSERT INTO Review (CustomerID, ProductID, Rating, ReviewText, ReviewDate) VALUES
(1, 1, 5, 'Amazing phone, worth the price!', '2025-01-12'),
(2, 3, 4, 'Good quality sneakers.', '2025-01-17'),
(3, 4, 3, 'Jeans are fine, but size issue.', '2025-02-02'),
(4, 2, 5, 'TV picture quality is excellent.', '2025-02-12'),
(5, 5, 5, 'Luxury watch, absolutely stunning!', '2025-02-18'),
(6, 6, 4, 'Comfortable T-shirt.', '2025-03-02'),
(7, 7, 5, 'Best sound quality headphones.', '2025-03-06'),
(8, 8, 4, 'Good bat for practice.', '2025-03-08'),
(9, 9, 4, 'Strong wooden table.', '2025-03-11'),
(10, 10, 5, 'Loved this book!', '2025-03-13'),
(11, 11, 5, 'Gaming experience is insane!', '2025-03-16'),
(12, 12, 3, 'Decent sketchbook.', '2025-03-21'),
(13, 13, 4, 'Fragrance is long-lasting.', '2025-03-26'),
(14, 14, 4, 'Kids enjoyed the toy car.', '2025-04-02'),
(15, 15, 5, 'Quality rice, affordable price.', '2025-04-06');


-- ========================
-- Step 1: Preview Data
-- ========================
-- Preview first 5 rows from City table
SELECT * FROM City LIMIT 5;

-- Preview first 5 rows from Customer table
SELECT * FROM Customer LIMIT 5;

-- Preview first 5 rows from Category table
SELECT * FROM Category LIMIT 5;

-- Preview first 5 rows from Product table
SELECT * FROM Product LIMIT 5;

-- Preview first 5 rows from Orders table
SELECT * FROM Orders LIMIT 5;

-- Preview first 5 rows from OrderedProduct table
SELECT * FROM OrderedProduct LIMIT 5;

-- Preview first 5 rows from Review table
SELECT * FROM Review LIMIT 5;

-- ========================
-- Step 2: Basic SELECT Queries
-- ========================
-- List all customers with their city names
SELECT c.FirstName, c.LastName, ci.CityName
FROM Customer c
JOIN City ci ON c.CityID = ci.CityID;

-- List all products with their category names and prices
SELECT p.ProductName, c.CategoryName, p.Price
FROM Product p
JOIN Category c ON p.CategoryID = c.CategoryID;

-- ========================
-- Step 3: Filtering Data (WHERE)
-- ========================
-- Customers living in CityID = 1
SELECT FirstName, LastName 
FROM Customer
WHERE CityID = 1;

-- Products priced above 500
SELECT ProductName, Price
FROM Product
WHERE Price > 500;

-- ========================
-- Step 4: Sorting Data (ORDER BY)
-- ========================
-- Products ordered from highest to lowest price
SELECT ProductName, Price
FROM Product
ORDER BY Price DESC;

-- Orders listed by most recent order date
SELECT OrderID, OrderDate, TotalAmount
FROM Orders
ORDER BY OrderDate DESC;

-- ========================
-- Step 5: Aggregation (GROUP BY & Aggregate Functions)
-- ========================
-- Total sales for each product
SELECT p.ProductName, SUM(op.Price * op.Quantity) AS TotalSales
FROM OrderedProduct op
JOIN Product p ON op.ProductID = p.ProductID
GROUP BY p.ProductName;

-- Average rating per product
SELECT p.ProductName, AVG(r.Rating) AS AvgRating
FROM Review r
JOIN Product p ON r.ProductID = p.ProductID
GROUP BY p.ProductName;

-- Number of orders per customer
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS NumOrders
FROM Customer c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

-- ========================
-- Step 6: Joins
-- ========================
-- List orders with customer names, product names, quantity, and price
SELECT o.OrderID, c.FirstName, c.LastName, p.ProductName, op.Quantity, op.Price
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN OrderedProduct op ON o.OrderID = op.OrderID
JOIN Product p ON op.ProductID = p.ProductID;

-- Left join to see all customers with or without orders
SELECT c.FirstName, c.LastName, o.OrderID
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- ========================
-- Step 7: Subqueries
-- ========================
-- Find customers who spent more than the average order total
SELECT FirstName, LastName, CustomerID
FROM Customer
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    HAVING SUM(TotalAmount) > (
        SELECT AVG(TotalAmount) FROM Orders
    )
);

-- Products that were never ordered
SELECT ProductName
FROM Product
WHERE ProductID NOT IN (
    SELECT ProductID FROM OrderedProduct
);

-- ========================
-- Step 8: Views
-- ========================
-- Create a view summarizing total orders and spending per customer
CREATE OR REPLACE VIEW CustomerOrderSummary AS
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders, 
       SUM(op.Price * op.Quantity) AS TotalSpent
FROM Customer c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN OrderedProduct op ON o.OrderID = op.OrderID
GROUP BY c.CustomerID;

-- Query the view
SELECT * FROM CustomerOrderSummary;

-- ========================
-- Step 9: Indexing (Optimization)
-- ========================
-- Index on Customer.CityID
CREATE INDEX idx_customer_city ON Customer(CityID);

-- Index on Product.CategoryID
CREATE INDEX idx_product_category ON Product(CategoryID);

-- Index on Orders.CustomerID
CREATE INDEX idx_order_customer ON Orders(CustomerID);

-- Index on OrderedProduct.OrderID
CREATE INDEX idx_orderproduct_order ON OrderedProduct(OrderID);

-- Index on OrderedProduct.ProductID
CREATE INDEX idx_orderproduct_product ON OrderedProduct(ProductID);