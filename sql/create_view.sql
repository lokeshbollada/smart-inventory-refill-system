-- view sql
USE InventoryDB;
GO

CREATE VIEW Inventory_Refill_Recommendations AS
WITH movement_stats AS (
    SELECT
        p.product_id,
        SUM(CASE 
                WHEN im.movement_type = 'IN'  THEN im.quantity
                WHEN im.movement_type = 'OUT' THEN -im.quantity
                ELSE 0
            END
        ) AS current_stock,

        CAST(
            ISNULL(
                SUM(
                    CASE 
                        WHEN im.movement_type = 'OUT'
                             AND im.movement_date >= DATEADD(DAY, -30, GETDATE())
                        THEN im.quantity
                        ELSE 0
                    END
                ) / 30.0, 0
            ) AS DECIMAL(10,2)
        ) AS avg_daily_usage_30d,

        MAX(
            CASE WHEN im.movement_type = 'OUT' THEN im.movement_date END
        ) AS last_out_date

    FROM products p
    LEFT JOIN inventory_movements im ON p.product_id = im.product_id
    GROUP BY p.product_id
)

SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.abc_class,
    v.vendor_name,
    v.lead_time_days,
    p.target_stock,
    p.safety_stock,
    ms.current_stock,
    ms.avg_daily_usage_30d,

    CAST(
        (ms.avg_daily_usage_30d * v.lead_time_days) + p.safety_stock
        AS DECIMAL(10,2)
    ) AS reorder_point,

    CASE 
        WHEN ms.current_stock < ((ms.avg_daily_usage_30d * v.lead_time_days) + p.safety_stock)
            THEN 'YES'
        ELSE 'NO'
    END AS need_reorder,

    CASE 
        WHEN ms.current_stock < ((ms.avg_daily_usage_30d * v.lead_time_days) + p.safety_stock)
            THEN (p.target_stock - ms.current_stock)
        ELSE 0
    END AS recommended_order_qty,

    CASE 
        WHEN ms.last_out_date < DATEADD(DAY, -60, GETDATE()) THEN 'YES'
        ELSE 'NO'
    END AS dead_stock_flag

FROM products p
LEFT JOIN movement_stats ms ON p.product_id = ms.product_id
LEFT JOIN vendors v ON p.vendor_id = v.vendor_id;
