CREATE VIEW vw_ProductStock AS
SELECT
p.ProductID,
p.ProductName,
i.Quantity
FROM Products p
JOIN Inventory i
ON p.ProductID=i.ProductID;

CREATE VIEW vw_LowStockProducts AS
SELECT
p.ProductName,
i.Quantity
FROM Products p
JOIN Inventory i
ON p.ProductID=i.ProductID
WHERE i.Quantity<50;

CREATE VIEW vw_DailySales AS
SELECT
SaleDate,
SUM(TotalAmount) TotalSales
FROM Sales
GROUP BY SaleDate;

CREATE VIEW vw_MonthlySales AS
SELECT
MONTH(SaleDate) AS MonthNo,
SUM(TotalAmount) AS TotalSales
FROM Sales
GROUP BY MONTH(SaleDate);

CREATE VIEW vw_CustomerPurchases AS
SELECT
c.Name,
s.SaleID,
s.TotalAmount
FROM Customers c
JOIN Sales s
ON c.CustomerID=s.CustomerID;
