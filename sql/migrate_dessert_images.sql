-- Link renamed dessert photos to menu items
USE vanilla_db;

UPDATE Product SET image_file = 'baklava_platter.jpg'    WHERE product_name = 'Baklava Platter';
UPDATE Product SET image_file = 'basbousa.jpg'             WHERE product_name = 'Basbousa';
UPDATE Product SET image_file = 'cheesecake.jpg'          WHERE product_name = 'Cheesecake';
UPDATE Product SET image_file = 'chocolate_brownie.jpg'   WHERE product_name = 'Chocolate Brownie';
UPDATE Product SET image_file = 'chocolate_lava_cake.jpg' WHERE product_name = 'Chocolate Lava Cake';
UPDATE Product SET image_file = 'classic_om_ali.jpg'      WHERE product_name = 'Classic Om Ali';
UPDATE Product SET image_file = 'creme_brulee.jpg'        WHERE product_name = 'Creme Brulee';
UPDATE Product SET image_file = 'fruit_tart.jpg'          WHERE product_name = 'Fruit Tart';
UPDATE Product SET image_file = 'kunafa.jpg'              WHERE product_name = 'Kunafa';
UPDATE Product SET image_file = 'om_ali_with_nuts.jpg'    WHERE product_name = 'Om Ali with Nuts';
UPDATE Product SET image_file = 'panna_cotta.jpg'         WHERE product_name = 'Panna Cotta';
UPDATE Product SET image_file = 'tiramisu.jpg'            WHERE product_name = 'Tiramisu';

SELECT product_name, image_file FROM Product WHERE product_category = 'Desserts' ORDER BY product_name;
