CREATE OR REPLACE VIEW RETAIL_DB.PRESENTATION_SCHEMA.VW_RETAIL_SALES AS
SELECT 
    f.SalesKey,
    f.OrderID,
    c.CustomerID,
    c.CustomerName,
    c.Phone,
    c.Email,
    p.ProductID,
    p.ProductName,
    p.Category,
    d.FullDate AS OrderDate,
    d.DayOfWeek,
    d.Month,
    d.Quarter,
    d.Year,
    f.Quantity,
    f.UnitPrice,
    f.LineAmount,
    f.LoadDate
FROM TRANSFORMATION_SCHEMA.FACT_RETAIL_SALES f
JOIN TRANSFORMATION_SCHEMA.DIM_CUSTOMER c ON f.CustomerKey = c.CustomerKey
JOIN TRANSFORMATION_SCHEMA.DIM_PRODUCT  p ON f.ProductKey = p.ProductKey
JOIN TRANSFORMATION_SCHEMA.DIM_DATE     d ON f.DateKey = d.DateKey;


CREATE OR REPLACE VIEW RETAIL_DB.PRESENTATION_SCHEMA.VW_CUSTOMER_SALES_SUMMARY AS
SELECT 
    c.CustomerID,
    c.CustomerName,
    COUNT(DISTINCT f.OrderID) AS TotalOrders,
    SUM(f.Quantity) AS TotalQuantity,
    SUM(f.LineAmount) AS TotalRevenue
FROM TRANSFORMATION_SCHEMA.FACT_RETAIL_SALES f
JOIN TRANSFORMATION_SCHEMA.DIM_CUSTOMER c ON f.CustomerKey = c.CustomerKey
GROUP BY c.CustomerID, c.CustomerName;


CREATE OR REPLACE VIEW RETAIL_DB.PRESENTATION_SCHEMA.VW_PRODUCT_SALES_SUMMARY AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(f.Quantity) AS TotalQuantitySold,
    SUM(f.LineAmount) AS TotalRevenue
FROM TRANSFORMATION_SCHEMA.FACT_RETAIL_SALES f
JOIN TRANSFORMATION_SCHEMA.DIM_PRODUCT p ON f.ProductKey = p.ProductKey
GROUP BY p.ProductID, p.ProductName, p.Category;


CREATE OR REPLACE VIEW RETAIL_DB.PRESENTATION_SCHEMA.VW_MONTHLY_SALES AS
SELECT 
    d.Year,
    d.Month,
    SUM(f.Quantity) AS TotalQuantity,
    SUM(f.LineAmount) AS TotalRevenue
FROM TRANSFORMATION_SCHEMA.FACT_RETAIL_SALES f
JOIN TRANSFORMATION_SCHEMA.DIM_DATE d ON f.DateKey = d.DateKey
GROUP BY d.Year, d.Month
ORDER BY d.Year, d.Month;
