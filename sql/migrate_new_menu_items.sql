-- Add new menu items, link images, and make available at AL Tireh + Nablus
USE vanilla_db;

INSERT INTO Product (product_name, product_category, product_price, product_description, image_file)
SELECT 'Grilled Salmon', 'Meats', 62.00, 'Grilled salmon fillet with roasted vegetables', 'grilled_salmon.jpg'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Grilled Salmon');

INSERT INTO Product (product_name, product_category, product_price, product_description, image_file)
SELECT 'Veggie Pizza', 'Pizza', 36.00, 'Mixed vegetables on tomato and mozzarella', 'veggie_pizza.jpg'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Veggie Pizza');

INSERT INTO Product (product_name, product_category, product_price, product_description, image_file)
SELECT 'Mankousheh', 'BreakFast', 18.00, 'Traditional za''atar and cheese flatbread', 'mankousheh.jpg'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Mankousheh');

INSERT INTO Product (product_name, product_category, product_price, product_description, image_file)
SELECT 'Halloumi with Ka''ek Al Quds', 'BreakFast', 24.00, 'Grilled halloumi in sesame ka''ek with salad', 'halloumi_with_kaek_al_quds.jpg'
WHERE NOT EXISTS (SELECT 1 FROM Product WHERE product_name = 'Halloumi with Ka''ek Al Quds');

-- Link images for existing items
UPDATE Product SET image_file = 'spaghetti_bolognese.jpg' WHERE product_name = 'Spaghetti Bolognese';
UPDATE Product SET image_file = 'veggie_burger.jpg'       WHERE product_name = 'Veggie Burger';
UPDATE Product SET image_file = 'classic_beef_burger.jpg' WHERE product_name = 'Classic Beef Burger';

-- Make new items available at AL Tireh (1) and Nablus (4)
INSERT INTO Branch_Product (branch_id, product_id, is_available, branch_price)
SELECT b.branch_id, p.product_id, TRUE, p.product_price
FROM Product p
JOIN Branches b ON b.branch_id IN (1, 4)
WHERE p.product_name IN (
    'Grilled Salmon', 'Veggie Pizza', 'Mankousheh', 'Halloumi with Ka''ek Al Quds'
)
ON DUPLICATE KEY UPDATE
    is_available = TRUE,
    branch_price = VALUES(branch_price);

SELECT p.product_name, p.product_category, p.image_file, b.branch_name
FROM Product p
JOIN Branch_Product bp ON bp.product_id = p.product_id
JOIN Branches b ON b.branch_id = bp.branch_id
WHERE p.product_name IN (
    'Grilled Salmon', 'Veggie Pizza', 'Mankousheh', 'Halloumi with Ka''ek Al Quds',
    'Spaghetti Bolognese', 'Veggie Burger', 'Classic Beef Burger'
)
  AND bp.branch_id IN (1, 4)
  AND bp.is_available = TRUE
ORDER BY p.product_name, b.branch_name;
