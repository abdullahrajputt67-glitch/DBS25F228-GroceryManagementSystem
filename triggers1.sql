DELIMITER $$

CREATE TRIGGER trg_UpdateStockAfterSale

AFTER INSERT
ON SaleDetails

FOR EACH ROW

BEGIN

UPDATE Inventory
SET Quantity = Quantity - NEW.Quantity
WHERE ProductID = NEW.ProductID;

END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_LogProductInsert

AFTER INSERT
ON Products

FOR EACH ROW

BEGIN

INSERT INTO AuditLogs(ActionType)
VALUES
(CONCAT('Product Added: ',NEW.ProductName));

END $$

DELIMITER ;