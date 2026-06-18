-- Add dine-in tables for branches that were missing them
USE vanilla_db;

INSERT INTO Tables (branch_id, capacity) VALUES
-- AL Irsal (3)
(3, 4), (3, 4), (3, 6),
-- Nablus Branch (4)
(4, 2), (4, 4), (4, 4), (4, 6),
-- Icon Mall (5)
(5, 2), (5, 4), (5, 6), (5, 8),
-- Al Manara (6)
(6, 2), (6, 4), (6, 6), (6, 6);

SELECT b.branch_name, COUNT(t.table_id) AS tables, GROUP_CONCAT(t.capacity ORDER BY t.table_id) AS capacities
FROM Branches b
LEFT JOIN Tables t ON t.branch_id = b.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY b.branch_id;
