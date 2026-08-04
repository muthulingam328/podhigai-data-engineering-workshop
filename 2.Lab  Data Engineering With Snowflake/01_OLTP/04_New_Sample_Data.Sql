-- -------------------------
-- CUSTOMERS
-- -------------------------
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C001', 'John Doe', '9876543210', 'john.doe@example.com');
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C002', 'Jane Smith', '9123456780', 'jane.smith@example.com');
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C003', 'Robert Brown', '9988776655', 'robert.brown@example.com');
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C004', 'Emily White', '9871234560', 'emily.white@example.com');
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C005', 'Michael Green', '9765432180', 'michael.green@example.com');

-- -------------------------
-- PRODUCTS
-- -------------------------
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P001', 'Laptop', 'Electronics', 75000);
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P002', 'Smartphone', 'Electronics', 25000);
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P003', 'Desk Chair', 'Furniture', 5500);
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P004', 'Notebook', 'Stationery', 120);
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P005', 'Pen', 'Stationery', 20);

-- -------------------------
-- ORDERS
-- -------------------------
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1001', 'C001', DATE '2025-09-01');
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1002', 'C002', DATE '2025-09-01');
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1003', 'C003', DATE '2025-09-02');
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1004', 'C004', DATE '2025-09-02');
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1005', 'C005', DATE '2025-09-03');

-- -------------------------
-- ORDERDETAILS
-- -------------------------
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1001', 'O1001', 'P001', 1, 75000);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1002', 'O1001', 'P004', 5, 120);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1003', 'O1002', 'P002', 2, 25000);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1004', 'O1003', 'P003', 1, 5500);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1005', 'O1003', 'P005', 10, 20);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1006', 'O1004', 'P004', 3, 120);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1007', 'O1005', 'P005', 15, 20);


-- -------------------------
-- CUSTOMERS
-- -------------------------
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C006', 'Sophia Turner', '9876001234', 'sophia.turner@example.com');
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C007', 'David Wilson', '9123005678', 'david.wilson@example.com');
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C008', 'Olivia Martin', '9988112233', 'olivia.martin@example.com');
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C009', 'Daniel Scott', '9871556677', 'daniel.scott@example.com');
INSERT INTO CUSTOMERS (CustomerID, Name, Phone, Email) VALUES ('C010', 'Grace Lee', '9765007788', 'grace.lee@example.com');

-- -------------------------
-- PRODUCTS
-- -------------------------
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P006', 'Headphones', 'Electronics', 3500);
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P007', 'Office Desk', 'Furniture', 12000);
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P008', 'Water Bottle', 'Stationery', 250);
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P009', 'Backpack', 'Accessories', 1500);
INSERT INTO PRODUCTS (ProductID, ProductName, Category, Price) VALUES ('P010', 'Smartwatch', 'Electronics', 18000);

-- -------------------------
-- ORDERS
-- -------------------------
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1006', 'C006', DATE '2025-09-04');
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1007', 'C007', DATE '2025-09-04');
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1008', 'C008', DATE '2025-09-05');
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1009', 'C009', DATE '2025-09-05');
INSERT INTO ORDERS (OrderID, CustomerID, OrderDate) VALUES ('O1010', 'C010', DATE '2025-09-06');

-- -------------------------
-- ORDERDETAILS
-- -------------------------
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1008', 'O1006', 'P006', 2, 3500);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1009', 'O1006', 'P009', 1, 1500);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1010', 'O1007', 'P007', 1, 12000);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1011', 'O1008', 'P010', 1, 18000);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1012', 'O1008', 'P008', 3, 250);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1013', 'O1009', 'P001', 1, 75000);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1014', 'O1010', 'P002', 1, 25000);
INSERT INTO ORDERDETAILS (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES ('OD1015', 'O1010', 'P005', 20, 20);
