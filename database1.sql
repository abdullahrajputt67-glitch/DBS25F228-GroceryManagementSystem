CREATE DATABASE GroceryStoreDB;
USE GroceryStoreDB;

CREATE TABLE Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    RoleID INT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20) UNIQUE,
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);



CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) UNIQUE,
    Address VARCHAR(255)
);


CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20) UNIQUE,
    Address VARCHAR(255)
);


CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    CategoryID INT NOT NULL,
    SupplierID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL UNIQUE,
    Quantity INT NOT NULL DEFAULT 0 CHECK (Quantity >= 0),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Purchases (
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierID INT NOT NULL,
    PurchaseDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE PurchaseDetails (
    PurchaseDetailID INT AUTO_INCREMENT PRIMARY KEY,
    PurchaseID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    CostPrice DECIMAL(10,2) NOT NULL CHECK (CostPrice > 0),
    FOREIGN KEY (PurchaseID) REFERENCES Purchases(PurchaseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT NOT NULL,
    SaleDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE SaleDetails (
    SaleDetailID INT AUTO_INCREMENT PRIMARY KEY,
    SaleID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL CHECK (UnitPrice > 0),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    SaleID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
);

CREATE TABLE AuditLogs (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    ActionType VARCHAR(100) NOT NULL,
    ActionDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE StockAlerts (
    AlertID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT NOT NULL,
    AlertMessage VARCHAR(255) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ReportHistory (
    ReportID INT AUTO_INCREMENT PRIMARY KEY,
    ReportName VARCHAR(100) NOT NULL,
    GeneratedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO Roles(RoleName)
VALUES
('Admin'),
('Manager'),
('Cashier');

INSERT INTO Users(Username,Password,RoleID)
VALUES
('admin','admin123',1),
('manager','manager123',2),
('cashier','cashier123',3);

INSERT INTO Employees(Name,Email,Phone,Salary,UserID)
VALUES
('Ali Khan','ali@gmail.com','03001111111',50000,1),
('Ahmed Raza','ahmed@gmail.com','03002222222',45000,2),
('Usman Tariq','usman@gmail.com','03003333333',35000,3);

INSERT INTO Customers(Name,Phone,Address)
VALUES
('Bilal','03004444444','Lahore'),
('Hamza','03005555555','Kasur'),
('Awais','03006666666','Sheikhupura');

INSERT INTO Suppliers(SupplierName,Phone,Address)
VALUES
('Nestle Distributor','03007777777','Lahore'),
('Pepsi Distributor','03008888888','Lahore'),
('Unilever Distributor','03009999999','Karachi');

INSERT INTO Categories(CategoryName)
VALUES
('Beverages'),
('Dairy'),
('Snacks'),
('Bakery');

INSERT INTO Products(ProductName,Price,CategoryID,SupplierID)
VALUES
('Milk Pack',250,2,1),
('Pepsi 1.5L',180,1,2),
('Lays Chips',100,3,2),
('Bread',120,4,1),
('Tea Pack',350,1,3);

INSERT INTO Inventory(ProductID,Quantity)
VALUES
(1,100),
(2,200),
(3,150),
(4,80),
(5,60);

INSERT INTO Purchases(SupplierID,PurchaseDate,TotalAmount)
VALUES
(1,'2026-01-10',25000),
(2,'2026-01-11',30000),
(3,'2026-01-12',15000);

INSERT INTO PurchaseDetails(PurchaseID,ProductID,Quantity,CostPrice)
VALUES
(1,1,100,200),
(2,2,150,150),
(2,3,100,70),
(3,5,50,300);

INSERT INTO Sales(CustomerID,EmployeeID,SaleDate,TotalAmount)
VALUES
(1,1,'2026-01-15',1000),
(2,2,'2026-01-15',850),
(3,3,'2026-01-16',1200);

INSERT INTO SaleDetails(SaleID,ProductID,Quantity,UnitPrice)
VALUES
(1,1,2,250),
(1,3,5,100),
(2,2,3,180),
(3,5,2,350);

