-- Link remaining espresso drink photos
USE vanilla_db;

UPDATE Product SET image_file = 'americano.jpg'        WHERE product_name = 'Americano';
UPDATE Product SET image_file = 'flat_white.jpg'       WHERE product_name = 'Flat White';
UPDATE Product SET image_file = 'macchiato.jpg'        WHERE product_name = 'Macchiato';
UPDATE Product SET image_file = 'latte.jpg'            WHERE product_name = 'Latte';
UPDATE Product SET image_file = 'iced_americano.jpg'   WHERE product_name = 'Iced Americano';
UPDATE Product SET image_file = 'iced_latte.jpg'       WHERE product_name = 'Iced Latte';
UPDATE Product SET image_file = 'iced_cappuccino.jpg'  WHERE product_name = 'Iced Cappuccino';
UPDATE Product SET image_file = 'affogato.jpg'         WHERE product_name = 'Affogato';

SELECT product_name, product_category, image_file
FROM Product
WHERE product_category IN ('Espresso Hot', 'Espresso Cold')
ORDER BY product_category, product_name;
