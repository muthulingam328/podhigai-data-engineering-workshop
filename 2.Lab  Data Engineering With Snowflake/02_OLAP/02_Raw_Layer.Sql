-- ===============================
-- Customer Dimension
-- ===============================
CREATE OR REPLACE TABLE RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_CUSTOMER (
    CustomerKey     INT AUTOINCREMENT PRIMARY KEY,
    CustomerID      STRING,
    CustomerName    STRING,
    Phone           STRING,
    Email           STRING,
    EffectiveDate   DATE DEFAULT CURRENT_DATE,
    ExpiryDate      DATE,
    CurrentFlag     BOOLEAN DEFAULT TRUE
);

-- ===============================
-- Product Dimension
-- ===============================
CREATE OR REPLACE TABLE RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_PRODUCT (
    ProductKey      INT AUTOINCREMENT PRIMARY KEY,
    ProductID       STRING,
    ProductName     STRING,
    Category        STRING,
    EffectiveDate   DATE DEFAULT CURRENT_DATE,
    ExpiryDate      DATE,
    CurrentFlag     BOOLEAN DEFAULT TRUE
);

-- ===============================
-- Date Dimension
-- ===============================
CREATE OR REPLACE TABLE RETAIL_DB.TRANSFORMATION_SCHEMA.DIM_DATE (
    DateKey         INT PRIMARY KEY,   -- YYYYMMDD format
    FullDate        DATE,
    DayOfWeek       STRING,
    Month           STRING,
    Quarter         STRING,
    Year            INT
);

-- ===============================
-- Fact Table
-- ===============================
CREATE OR REPLACE TABLE RETAIL_DB.TRANSFORMATION_SCHEMA.FACT_RETAIL_SALES (
    SalesKey        INT AUTOINCREMENT PRIMARY KEY,
    OrderID         STRING,
    CustomerKey     INT,
    ProductKey      INT,
    DateKey         INT,
    Quantity        NUMBER,
    UnitPrice       NUMBER(10,2),
    LineAmount      NUMBER(12,2),
    LoadDate        DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (CustomerKey) REFERENCES DIM_CUSTOMER(CustomerKey),
    FOREIGN KEY (ProductKey) REFERENCES DIM_PRODUCT(ProductKey),
    FOREIGN KEY (DateKey) REFERENCES DIM_DATE(DateKey)
);
