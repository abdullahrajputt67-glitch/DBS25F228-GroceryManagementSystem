DELIMITER $$

CREATE PROCEDURE sp_AddProduct(
IN pName VARCHAR(100),
IN pPrice DECIMAL(10,2),
IN pCategoryID INT,
IN pSupplierID INT
)
BEGIN

INSERT INTO Products
(ProductName,Price,CategoryID,SupplierID)
VALUES
(pName,pPrice,pCategoryID,pSupplierID);

END $$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE sp_ProductCount()
BEGIN

SELECT COUNT(*) AS TotalProducts
FROM Products;

END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE sp_TotalSales()
BEGIN

SELECT SUM(TotalAmount) AS GrandTotal
FROM Sales;

END $$

DELIMITER ;
