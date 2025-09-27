SELECT * FROM ecommerce.shipping_ecommerce;
USE ecommerce;

-- a. Basic select with filter & order
SELECT *
FROM shipping_ecommerce
WHERE Discount_offered > 20
ORDER BY Weight_in_gms DESC;

-- b. Grouping & aggregate
SELECT Warehouse_block,
       COUNT(*) AS total_orders,
       AVG(Customer_rating) AS avg_rating
FROM shipping_ecommerce
GROUP BY Warehouse_block
ORDER BY total_orders DESC;


-- Helper table: details about each warehouse
CREATE TABLE warehouse_info (
    Warehouse_block CHAR(1) PRIMARY KEY,
    City VARCHAR(50)
);

INSERT INTO warehouse_info VALUES
('A','Delhi'),
('B','Mumbai'),
('C','Bangalore'),
('D','Chennai'),
('F','Kolkata');


-- INNER JOIN
SELECT s.Warehouse_block, w.City, COUNT(*) AS orders
FROM shipping_ecommerce s
INNER JOIN warehouse_info w
    ON s.Warehouse_block = w.Warehouse_block
GROUP BY s.Warehouse_block, w.City;


-- LEFT JOIN (all warehouses in ecommerce table)
SELECT s.Warehouse_block, w.City
FROM shipping_ecommerce s
LEFT JOIN warehouse_info w
    ON s.Warehouse_block = w.Warehouse_block;

-- RIGHT JOIN (all warehouses in warehouse_info)
SELECT s.Warehouse_block, w.City
FROM shipping_ecommerce s
RIGHT JOIN warehouse_info w
    ON s.Warehouse_block = w.Warehouse_block;
    
-- Subqueries
-- Orders heavier than the overall average weight
SELECT *
FROM shipping_ecommerce
WHERE Weight_in_gms >
      (SELECT AVG(Weight_in_gms) FROM shipping_ecommerce);
      
-- aggregate functions
SELECT
    SUM(Discount_offered) AS total_discount,
    AVG(Customer_rating) AS avg_rating,
    MAX(Weight_in_gms)   AS max_weight,
    MIN(Prior_purchases) AS min_prior
FROM shipping_ecommerce;

-- View: summary per shipment mode
CREATE OR REPLACE VIEW shipment_summary AS
SELECT Mode_of_Shipment,
       COUNT(*) AS total_orders,
       AVG(Discount_offered) AS avg_discount
FROM shipping_ecommerce
GROUP BY Mode_of_Shipment;


-- Index on frequently searched column
CREATE INDEX idx_discount
    ON shipping_ecommerce (Discount_offered);



    