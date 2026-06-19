-- Smaller branches: drinks + desserts only. Remove hookah everywhere.
USE vanilla_db;

DELETE bp FROM Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
WHERE p.product_category = 'hookah';

DELETE FROM Product WHERE product_category = 'hookah';

DELETE bp FROM Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
WHERE p.product_category = 'Food'
  AND bp.branch_id IN (2, 3, 5);

SELECT b.branch_name, p.product_category, COUNT(*) AS items
FROM Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
JOIN Branches b ON bp.branch_id = b.branch_id
WHERE b.branch_id IN (2, 3, 5)
GROUP BY b.branch_name, p.product_category
ORDER BY b.branch_name, p.product_category;
