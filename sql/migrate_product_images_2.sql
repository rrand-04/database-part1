-- Link newly uploaded menu images to products
USE vanilla_db;

UPDATE Product SET image_file = 'margherita_pizza.jpg'      WHERE product_name = 'Margherita Pizza';
UPDATE Product SET image_file = 'pepperoni_pizza.jpg'       WHERE product_name = 'Pepperoni Pizza';
UPDATE Product SET image_file = 'four_cheese_pizza.jpg'     WHERE product_name = 'Four Cheese Pizza';
UPDATE Product SET image_file = 'greek_salad.jpg'           WHERE product_name = 'Greek Salad';
UPDATE Product SET image_file = 'quinoa_power_salad.jpg'      WHERE product_name = 'Quinoa Power Salad';
UPDATE Product SET image_file = 'garlic_bread.jpg'          WHERE product_name = 'Garlic Bread';
UPDATE Product SET image_file = 'hummus_plate.jpg'          WHERE product_name = 'Hummus Plate';
UPDATE Product SET image_file = 'lamb_chops.jpg'            WHERE product_name = 'Lamb Chops';
UPDATE Product SET image_file = 'mixed_grill_platter.jpg'   WHERE product_name = 'Mixed Grill Platter';

SELECT product_name, product_category, image_file
FROM Product
WHERE image_file IS NOT NULL
ORDER BY product_category, product_name;
