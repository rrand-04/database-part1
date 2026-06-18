-- Remove Om Ali & International; give Nablus same restaurant menu as AL Tireh
USE vanilla_db;

-- Hide Om Ali and International on every branch
UPDATE Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
SET bp.is_available = FALSE
WHERE p.product_category IN ('Om Ali', 'International');

-- Nablus (4): turn off simple Food / Drinks / Desserts menu
UPDATE Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
SET bp.is_available = FALSE
WHERE bp.branch_id = 4
  AND p.product_category IN ('Food', 'Drinks', 'Desserts');

-- Copy AL Tireh restaurant items to Nablus (no Om Ali, International, hookah)
INSERT INTO Branch_Product (branch_id, product_id, is_available, branch_price)
SELECT 4, bp.product_id, TRUE, bp.branch_price
FROM Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
WHERE bp.branch_id = 1
  AND bp.is_available = TRUE
  AND p.product_category NOT IN ('Om Ali', 'International', 'hookah')
ON DUPLICATE KEY UPDATE
    is_available = TRUE,
    branch_price = VALUES(branch_price);

-- Ensure AL Tireh also has Om Ali/International disabled (already done above)
SELECT b.branch_name, p.product_category, COUNT(*) AS items
FROM Branch_Product bp
JOIN Branches b ON bp.branch_id = b.branch_id
JOIN Product p ON bp.product_id = p.product_id
WHERE b.branch_id IN (1, 4) AND bp.is_available = TRUE
GROUP BY b.branch_name, p.product_category
ORDER BY b.branch_name, p.product_category;
