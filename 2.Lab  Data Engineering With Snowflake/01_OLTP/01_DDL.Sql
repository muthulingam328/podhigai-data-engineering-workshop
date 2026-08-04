CREATE TABLE CUSTOMERS (
    CustomerID    VARCHAR2(10) PRIMARY KEY,
    Name          VARCHAR2(100),
    Phone         VARCHAR2(20),
    Email         VARCHAR2(100)
);


CREATE TABLE PRODUCTS (
    ProductID     VARCHAR2(10) PRIMARY KEY,
    ProductName   VARCHAR2(100),
    Category      VARCHAR2(50),
    Price         NUMBER(10,2)
);

CREATE TABLE ORDERS (
    OrderID       VARCHAR2(10) PRIMARY KEY,
    CustomerID    VARCHAR2(10) NOT NULL,
    OrderDate     DATE,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES CUSTOMERS(CustomerID)
);

CREATE TABLE ORDERDETAILS (
    OrderDetailID VARCHAR2(15) PRIMARY KEY,
    OrderID       VARCHAR2(10) NOT NULL,
    ProductID     VARCHAR2(10) NOT NULL,
    Quantity      NUMBER(5),
    Price         NUMBER(12,2),
    CONSTRAINT fk_order
        FOREIGN KEY (OrderID)
        REFERENCES ORDERS(OrderID),
    CONSTRAINT fk_product
        FOREIGN KEY (ProductID)
        REFERENCES PRODUCTS(ProductID)
);


CREATE OR REPLACE VIEW RETAIL_SALES_VW AS
SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerID,
    c.Name       AS CustomerName,
    c.Phone,
    c.Email,
    p.ProductID,
    p.ProductName,
    p.Category,
    od.Quantity,
    p.Price      AS UnitPrice,
    od.Price     AS LineAmount
FROM 
    ORDERS o
JOIN CUSTOMERS c 
    ON o.CustomerID = c.CustomerID
JOIN ORDERDETAILS od 
    ON o.OrderID = od.OrderID
JOIN PRODUCTS p 
    ON od.ProductID = p.ProductID;
