-- 1. Total Revenue
SELECT SUM(Sales * (1 - Discount)) AS TotalRevenue
FROM superstore;

-- 2. Revenue by Month
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Sales * (1 - Discount)) AS Revenue
FROM superstore
GROUP BY Month
ORDER BY Month;

-- 3. Top 10 Products by Revenue
SELECT 
    Product_Name,
    SUM(Sales * (1 - Discount)) AS Revenue
FROM superstore
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;

-- 4. Revenue by Category
SELECT 
    Category,
    SUM(Sales * (1 - Discount)) AS Revenue
FROM superstore
GROUP BY Category
ORDER BY Revenue DESC;

-- 5. Revenue by Region
SELECT 
    Region,
    SUM(Sales * (1 - Discount)) AS Revenue
FROM superstore
GROUP BY Region
ORDER BY Revenue DESC;

-- 6. Total Orders
SELECT COUNT(DISTINCT Order_ID) AS TotalOrders
FROM superstore;

-- 7. Customer Order Frequency (Repeat Customers)
SELECT 
    Customer_ID,
    COUNT(Order_ID) AS OrderCount
FROM superstore
GROUP BY Customer_ID
HAVING COUNT(Order_ID) > 1
ORDER BY OrderCount DESC;

-- 8. Discount Impact (Revenue Loss Due to Discount)
SELECT 
    SUM(Sales) AS GrossSales,
    SUM(Sales * Discount) AS DiscountLoss,
    SUM(Sales * (1 - Discount)) AS NetRevenue
FROM superstore;
 
