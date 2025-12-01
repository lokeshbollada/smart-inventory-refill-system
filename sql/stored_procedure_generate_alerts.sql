-- sp sql
USE InventoryDB;
GO

CREATE PROCEDURE GenerateLowStockAlerts
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO alerts (product_id, alert_type, priority, message)
    SELECT 
        product_id,
        'LOW_STOCK',
        CASE 
            WHEN abc_class = 'A' THEN 1
            WHEN abc_class = 'B' THEN 2
            ELSE 3
        END AS priority,
        CONCAT(product_name, ' is below reorder point. Recommended reorder: ', recommended_order_qty)
    FROM Inventory_Refill_Recommendations
    WHERE need_reorder = 'YES'
      AND product_id NOT IN (
            SELECT product_id FROM alerts WHERE status = 'OPEN'
      );
END;
GO
