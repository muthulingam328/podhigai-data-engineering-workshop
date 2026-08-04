-- ===============================
-- 1. Load Customer Dimension
-- ===============================
INSERT INTO RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_CUSTOMER (CustomerID, CustomerName, Phone, Email)
SELECT DISTINCT s.CustomerID, s.CustomerName, s.Phone, s.Email
FROM RETAIL_DB.STAGING_SCHEMA.RETAIL_SALES_STAGE s
WHERE NOT EXISTS (
    SELECT 1
    FROM RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_CUSTOMER c
    WHERE c.CustomerID = s.CustomerID
);

-- ===============================
-- 2. Load Product Dimension
-- ===============================
INSERT INTO RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_PRODUCT (ProductID, ProductName, Category)
SELECT DISTINCT s.ProductID, s.ProductName, s.Category
FROM RETAIL_DB.STAGING_SCHEMA.RETAIL_SALES_STAGE s
WHERE NOT EXISTS (
    SELECT 1
    FROM RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_PRODUCT p
    WHERE p.ProductID = s.ProductID
);

-- ===============================
-- 3. Load Date Dimension
-- ===============================
INSERT INTO RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_DATE (DateKey, FullDate, DayOfWeek, Month, Quarter, Year)
SELECT DISTINCT 
    TO_NUMBER(TO_CHAR(TO_DATE(s.OrderDate,'YYYY-MM-DD'), 'YYYYMMDD')) AS DateKey,
    TO_DATE(s.OrderDate,'YYYY-MM-DD') AS FullDate,
    TO_CHAR(TO_DATE(s.OrderDate,'YYYY-MM-DD'), 'DY') AS DayOfWeek,
    TO_CHAR(TO_DATE(s.OrderDate,'YYYY-MM-DD'), 'Mon') AS Month,
    TO_CHAR(TO_DATE(s.OrderDate,'YYYY-MM-DD'), 'Q') AS Quarter,
    TO_NUMBER(TO_CHAR(TO_DATE(s.OrderDate,'YYYY-MM-DD'), 'YYYY')) AS Year
FROM RETAIL_DB.STAGING_SCHEMA.RETAIL_SALES_STAGE s
WHERE NOT EXISTS (
    SELECT 1
    FROM RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_DATE d
    WHERE d.DateKey = TO_NUMBER(TO_CHAR(TO_DATE(s.OrderDate,'YYYY-MM-DD'),'YYYYMMDD'))
);

-- ===============================
-- 4. Load Fact Table
-- ===============================
INSERT INTO RETAIL_DB.TRANSFORMATION_SCHEMA.FACT_RETAIL_SALES
    (OrderID, CustomerKey, ProductKey, DateKey, Quantity, UnitPrice, LineAmount)
SELECT
    s.OrderID,
    c.CustomerKey,
    p.ProductKey,
    d.DateKey,
    TRY_TO_NUMBER(s.Quantity),
    TRY_TO_NUMBER(s.UnitPrice),
    TRY_TO_NUMBER(s.LineAmount)
FROM RETAIL_DB.STAGING_SCHEMA.RETAIL_SALES_STAGE s
JOIN RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_CUSTOMER c ON s.CustomerID = c.CustomerID
JOIN RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_PRODUCT  p ON s.ProductID = p.ProductID
JOIN RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_DATE     d ON TO_DATE(s.OrderDate,'YYYY-MM-DD') = d.FullDate;
