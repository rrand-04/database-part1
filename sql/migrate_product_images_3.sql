-- Link 4 newly uploaded menu images (renamed first)
USE vanilla_db;

UPDATE Product SET image_file = 'alfredo_pasta.jpg'  WHERE product_name = 'Alfredo Pasta';
UPDATE Product SET image_file = 'pesto_penne.jpg'    WHERE product_name = 'Pesto Penne';
UPDATE Product SET image_file = 'caesar_salad.jpg'   WHERE product_name = 'Caesar Salad';
UPDATE Product SET image_file = 'grilled_ribeye.jpg' WHERE product_name = 'Grilled Ribeye';

SELECT product_name, product_category, image_file
FROM Product
WHERE image_file IS NOT NULL
ORDER BY product_category, product_name;
