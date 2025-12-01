-- create_tables.sql
USE InventoryDB;
GO

-- products table
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    abc_class CHAR(1) CHECK (abc_class IN ('A','B','C')),
    target_stock INT NOT NULL,
    safety_stock INT NOT NULL,
    vendor_id INT NULL
);

-- vendors table
CREATE TABLE vendors (
    vendor_id INT IDENTITY(1,1) PRIMARY KEY,
    vendor_name VARCHAR(100) NOT NULL,
    lead_time_days INT NOT NULL,
    cost_per_unit DECIMAL(10,2) NOT NULL
);

-- inventory movements
CREATE TABLE inventory_movements (
    movement_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    vendor_id INT NULL,
    movement_type VARCHAR(15) NOT NULL,
    quantity INT NOT NULL,
    movement_date DATETIME NOT NULL DEFAULT(GETDATE()),
    CONSTRAINT fk_im_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_im_vendor FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id),
    CONSTRAINT chk_movement_type CHECK (movement_type IN ('IN','OUT','ADJUSTMENT')),
    CONSTRAINT chk_quantity_positive CHECK (quantity > 0)
);

-- alerts
CREATE TABLE alerts (
    alert_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    alert_type VARCHAR(50) NOT NULL,
    priority INT NOT NULL,
    message VARCHAR(255),
    created_at DATETIME NOT NULL DEFAULT(GETDATE()),
    status VARCHAR(20) NOT NULL DEFAULT('OPEN'),
    CONSTRAINT fk_alert_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);
