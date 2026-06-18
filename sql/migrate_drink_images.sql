-- Link renamed drink photos to menu items
USE vanilla_db;

UPDATE Product SET image_file = 'espresso.jpg'             WHERE product_name = 'Espresso';
UPDATE Product SET image_file = 'latte.jpg'                WHERE product_name = 'Latte';
UPDATE Product SET image_file = 'cappuccino.jpg'           WHERE product_name = 'Cappuccino';
UPDATE Product SET image_file = 'caramel_latte.jpg'        WHERE product_name = 'Caramel Latte';
UPDATE Product SET image_file = 'cortado.jpg'              WHERE product_name = 'Cortado';
UPDATE Product SET image_file = 'iced_mocha.jpg'           WHERE product_name = 'Iced Mocha';
UPDATE Product SET image_file = 'fresh_orange_juice.jpg'   WHERE product_name = 'Fresh Orange Juice';
UPDATE Product SET image_file = 'iced_tea.jpg'             WHERE product_name = 'Iced Tea';
UPDATE Product SET image_file = 'lemon_mint.jpg'           WHERE product_name = 'Lemon Mint';
UPDATE Product SET image_file = 'mango_passion.jpg'        WHERE product_name = 'Mango Passion';
UPDATE Product SET image_file = 'strawberry_refresher.jpg' WHERE product_name = 'Strawberry Refresher';
UPDATE Product SET image_file = 'watermelon_cooler.jpg'    WHERE product_name = 'Watermelon Cooler';

SELECT product_name, product_category, image_file
FROM Product
WHERE product_category IN ('Espresso Hot', 'Espresso Cold', 'Refreshers')
ORDER BY product_category, product_name;
