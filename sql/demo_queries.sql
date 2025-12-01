-- demo
USE InventoryDB;
GO

-- Check recommendation engine
SELECT * FROM Inventory_Refill_Recommendations;

-- Check alerts
SELECT * FROM alerts;

-- Forcing low stock scenario to check the queries
-- INSERT INTO inventory_movements (product_id, vendor_id, movement_type, quantity, movement_date)
-- VALUES (1, 1, 'OUT', 80, GETDATE());

-- Then :
-- EXEC GenerateLowStockAlerts;
-- SELECT * FROM alerts;
