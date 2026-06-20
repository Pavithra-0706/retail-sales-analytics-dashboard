CREATE DATABASE retail_project;
USE retail_project;


CREATE TABLE sales (
 OrderID INT PRIMARY KEY,
 OrderDate DATE,
 CustomerID VARCHAR(10),
 CustomerName VARCHAR(50),
 City VARCHAR(50),
 State VARCHAR(50),
 Product VARCHAR(50),
 Category VARCHAR(50),
 Quantity INT,
 UnitPrice INT,
 Revenue INT,
 PaymentMethod VARCHAR(20),
 Month VARCHAR(20)
);
SELECT COUNT(*) FROM sales;

#🧮 1. Total Revenue
SELECT SUM(Revenue) AS TotalRevenue
FROM sales;

#🛍 2. Revenue by Category
SELECT Category, SUM(Revenue) AS CategoryRevenue
FROM sales
GROUP BY Category
ORDER BY CategoryRevenue DESC;

#🏆 3. Top 5 Customers
SELECT CustomerName, SUM(Revenue) AS TotalSpent
FROM sales
GROUP BY CustomerName
ORDER BY TotalSpent DESC
LIMIT 5;

#🗺 4. Revenue by State
SELECT State, SUM(Revenue) AS StateRevenue
FROM sales
GROUP BY State
ORDER BY StateRevenue DESC;

#📆 5. Monthly Sales Trend
SELECT Month, SUM(Revenue) AS MonthlyRevenue
FROM sales
GROUP BY Month
ORDER BY FIELD(Month,
 'January','February','March','April','May','June',
 'July','August','September','October','November','December');

#💳 6. Payment Method Usage
SELECT PaymentMethod, COUNT(*) AS NumberOfTransactions
FROM sales
GROUP BY PaymentMethod;

#🛒 7. Most Sold Products
SELECT Product, SUM(Quantity) AS TotalUnitsSold
FROM sales
GROUP BY Product
ORDER BY TotalUnitsSold DESC;

#🧑‍💼 8. Average Order Value
SELECT AVG(Revenue) AS AverageOrderValue
FROM sales;

#📈 9. City-wise Performance
SELECT City, SUM(Revenue) AS CityRevenue
FROM sales
GROUP BY City
ORDER BY CityRevenue DESC;

#🧾 10. High-Value Orders
SELECT *
FROM sales
WHERE Revenue > (SELECT AVG(Revenue) FROM sales)
ORDER BY Revenue DESC;
