START TRANSACTION;

INSERT INTO Sales
(CustomerID,EmployeeID,SaleDate,TotalAmount)
VALUES
(1,1,CURDATE(),500);

INSERT INTO Payments
(SaleID,PaymentDate,Amount)
VALUES
(LAST_INSERT_ID(),CURDATE(),500);

COMMIT;


START TRANSACTION;

INSERT INTO Purchases
(SupplierID,PurchaseDate,TotalAmount)
VALUES
(1,CURDATE(),20000);

INSERT INTO PurchaseDetails
(PurchaseID,ProductID,Quantity,CostPrice)
VALUES
(LAST_INSERT_ID(),1,100,200);

COMMIT;


START TRANSACTION;

INSERT INTO Users
(Username,Password,RoleID)
VALUES
('newemployee','12345',3);

INSERT INTO Employees
(Name,Email,Phone,Salary,UserID)
VALUES
('New Employee',
'new@gmail.com',
'03001231234',
30000,
LAST_INSERT_ID());

COMMIT;