-- sample data
USE InventoryDB;
GO

-- Insert vendors
INSERT INTO vendors (vendor_name, lead_time_days, cost_per_unit)
VALUES
('Global Foods Supplier', 3, 45.00),
('FreshFarm Distributors', 5, 42.50),
('Daily Essentials Wholesale', 2, 30.00);

-- Insert products
INSERT INTO products (product_name, category, abc_class, target_stock, safety_stock, vendor_id)
VALUES
('Aashirvaad Atta 10kg', 'Grocery', 'A', 100, 20, 1),
('Tata Salt 1kg',        'Grocery', 'A', 150, 30, 1),
('Parle-G Biscuits 800g','Snacks',  'B', 80,  15, 2),
('Colgate Paste 100g',   'Personal','B', 60,  10, 3),
('Local Brand Pickle',   'Grocery', 'C', 40,  5,  2);

-- Initial stock IN
INSERT INTO inventory_movements (product_id, vendor_id, movement_type, quantity, movement_date)
VALUES
(1, 1, 'IN', 120, DATEADD(DAY, -20, GETDATE())),
(2, 1, 'IN', 200, DATEADD(DAY, -18, GETDATE())),
(3, 2, 'IN', 100, DATEADD(DAY, -15, GETDATE())),
(4, 3, 'IN', 70,  DATEADD(DAY, -10, GETDATE())),
(5, 2, 'IN', 60,  DATEADD(DAY, -40, GETDATE()));

-- OUT movements
INSERT INTO inventory_movements (product_id, vendor_id, movement_type, quantity, movement_date)
VALUES
(1, 1, 'OUT', 10, DATEADD(DAY, -9, GETDATE())),
(1, 1, 'OUT', 12, DATEADD(DAY, -7, GETDATE())),
(1, 1, 'OUT',  8, DATEADD(DAY, -3, GETDATE())),
(2, 1, 'OUT', 20, DATEADD(DAY, -8, GETDATE())),
(2, 1, 'OUT', 18, DATEADD(DAY, -4, GETDATE())),
(3, 2, 'OUT', 15, DATEADD(DAY, -5, GETDATE())),
(3, 2, 'OUT', 10, DATEADD(DAY, -2, GETDATE())),
(4, 3, 'OUT',  5, DATEADD(DAY, -1, GETDATE()));
