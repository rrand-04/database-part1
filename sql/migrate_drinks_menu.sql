-- Drinks menu: Espresso Hot, Espresso Cold, Refreshers
USE vanilla_db;

-- Reclassify existing drinks
UPDATE Product SET product_category = 'Espresso Hot',  product_description = '1 shot espresso with steamed milk' WHERE product_name = 'Latte';
UPDATE Product SET product_category = 'Espresso Hot',  product_description = '1 shot espresso with milk foam'    WHERE product_name = 'Cappuccino';
UPDATE Product SET product_category = 'Espresso Cold', product_description = '1 shot espresso over ice'          WHERE product_name = 'Iced Americano';
UPDATE Product SET product_category = 'Refreshers',    product_description = 'Refreshing cold brewed tea'        WHERE product_name = 'Iced Tea';
UPDATE Product SET product_category = 'Refreshers',    product_description = 'Freshly squeezed oranges'          WHERE product_name = 'Fresh Orange Juice';

-- New espresso hot drinks (1+ shots)
INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Espresso', 'Espresso Hot', 8.00, 'Single shot of espresso'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Espresso');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Americano', 'Espresso Hot', 10.00, '1 shot espresso with hot water'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Americano');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Flat White', 'Espresso Hot', 16.00, '2 shots espresso with velvety milk'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Flat White');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Macchiato', 'Espresso Hot', 12.00, '1 shot espresso marked with milk foam'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Macchiato');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Cortado', 'Espresso Hot', 14.00, '2 shots espresso with warm milk'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Cortado');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Mocha', 'Espresso Hot', 17.00, '1 shot espresso with chocolate and milk'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Mocha');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Caramel Latte', 'Espresso Hot', 18.00, '1 shot espresso with caramel and milk'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Caramel Latte');

-- New espresso cold drinks
INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Iced Latte', 'Espresso Cold', 16.00, '1 shot espresso with cold milk over ice'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Iced Latte');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Iced Cappuccino', 'Espresso Cold', 15.00, '1 shot espresso with cold foam over ice'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Iced Cappuccino');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Iced Mocha', 'Espresso Cold', 18.00, '1 shot espresso with chocolate over ice'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Iced Mocha');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Affogato', 'Espresso Cold', 20.00, '1 shot espresso poured over vanilla ice cream'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Affogato');

-- New refreshers (no espresso)
INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Lemon Mint', 'Refreshers', 12.00, 'Fresh lemon with mint and ice'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Lemon Mint');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Strawberry Refresher', 'Refreshers', 14.00, 'Strawberry and citrus cooler'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Strawberry Refresher');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Mango Passion', 'Refreshers', 14.00, 'Tropical mango and passion fruit'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Mango Passion');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Watermelon Cooler', 'Refreshers', 13.00, 'Fresh watermelon with a hint of mint'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Watermelon Cooler');

-- Enable all drink items at AL Tireh (1) and Nablus (4)
INSERT INTO Branch_Product (branch_id, product_id, is_available, branch_price)
SELECT b.branch_id, p.product_id, TRUE, p.product_price
FROM Product p
JOIN Branches b ON b.branch_id IN (1, 4)
WHERE p.product_category IN ('Espresso Hot', 'Espresso Cold', 'Refreshers')
ON DUPLICATE KEY UPDATE is_available = TRUE, branch_price = VALUES(branch_price);

-- Keep drinks available at coffee branches (2, 3, 5, 6) with updated categories
INSERT INTO Branch_Product (branch_id, product_id, is_available, branch_price)
SELECT b.branch_id, p.product_id, TRUE, p.product_price
FROM Product p
JOIN Branches b ON b.branch_id IN (2, 3, 5, 6)
WHERE p.product_category IN ('Espresso Hot', 'Espresso Cold', 'Refreshers')
ON DUPLICATE KEY UPDATE is_available = TRUE, branch_price = VALUES(branch_price);

SELECT p.product_category, COUNT(*) AS items
FROM Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
WHERE bp.branch_id = 1 AND bp.is_available = TRUE
  AND p.product_category IN ('Espresso Hot', 'Espresso Cold', 'Refreshers')
GROUP BY p.product_category
ORDER BY FIELD(p.product_category, 'Espresso Hot', 'Espresso Cold', 'Refreshers');
