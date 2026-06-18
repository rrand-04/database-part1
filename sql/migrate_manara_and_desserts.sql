-- Al Manara like AL Tireh/Nablus + restaurant desserts on all branches
USE vanilla_db;

-- Move Om Ali items into Desserts category
UPDATE Product SET product_category = 'Desserts'
WHERE product_name IN ('Classic Om Ali', 'Om Ali with Nuts');

-- New restaurant-style desserts
INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Chocolate Lava Cake', 'Desserts', 24.00, 'Warm chocolate cake with molten center and vanilla ice cream'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Chocolate Lava Cake');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Creme Brulee', 'Desserts', 22.00, 'Vanilla custard with caramelized sugar crust'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Creme Brulee');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Panna Cotta', 'Desserts', 20.00, 'Silky Italian cream with berry compote'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Panna Cotta');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Baklava Platter', 'Desserts', 18.00, 'Assorted phyllo pastries with honey and pistachio'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Baklava Platter');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Basbousa', 'Desserts', 16.00, 'Semolina cake soaked in sweet syrup'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Basbousa');

INSERT INTO Product (product_name, product_category, product_price, product_description)
SELECT 'Fruit Tart', 'Desserts', 19.00, 'Buttery tart with seasonal fresh fruits'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Fruit Tart');

-- Refresh descriptions on existing desserts
UPDATE Product SET product_description = 'New York style cheesecake with berry sauce' WHERE product_name = 'Cheesecake';
UPDATE Product SET product_description = 'Warm fudge brownie with chocolate chunks'   WHERE product_name = 'Chocolate Brownie';
UPDATE Product SET product_description = 'Classic Italian mascarpone and espresso'     WHERE product_name = 'Tiramisu';
UPDATE Product SET product_description = 'Crispy kunafa with sweet cheese filling'       WHERE product_name = 'Kunafa';
UPDATE Product SET product_description = 'Traditional Egyptian bread pudding with milk'  WHERE product_name = 'Classic Om Ali';
UPDATE Product SET product_description = 'Om Ali topped with almonds and pistachios'   WHERE product_name = 'Om Ali with Nuts';

-- Al Manara (6): disable simple Food menu
UPDATE Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
SET bp.is_available = FALSE
WHERE bp.branch_id = 6 AND p.product_category = 'Food';

-- Copy full AL Tireh menu to Al Manara (no hookah, no International)
INSERT INTO Branch_Product (branch_id, product_id, is_available, branch_price)
SELECT 6, bp.product_id, TRUE, bp.branch_price
FROM Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
WHERE bp.branch_id = 1
  AND bp.is_available = TRUE
  AND p.product_category NOT IN ('International', 'hookah')
ON DUPLICATE KEY UPDATE
    is_available = TRUE,
    branch_price = VALUES(branch_price);

-- Enable all desserts on every branch
INSERT INTO Branch_Product (branch_id, product_id, is_available, branch_price)
SELECT b.branch_id, p.product_id, TRUE, p.product_price
FROM Product p
JOIN Branches b ON b.branch_id IN (1, 2, 3, 4, 5, 6)
WHERE p.product_category = 'Desserts'
ON DUPLICATE KEY UPDATE
    is_available = TRUE,
    branch_price = VALUES(branch_price);

SELECT b.branch_name, p.product_category, COUNT(*) AS items
FROM Branch_Product bp
JOIN Branches b ON b.branch_id = bp.branch_id
JOIN Product p ON bp.product_id = p.product_id
WHERE bp.is_available = TRUE AND b.branch_id IN (1, 4, 6)
GROUP BY b.branch_name, p.product_category
ORDER BY b.branch_name, p.product_category;

SELECT product_name, product_price, product_description
FROM Product WHERE product_category = 'Desserts' ORDER BY product_name;
