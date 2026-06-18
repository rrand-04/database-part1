-- AL Tireh branch full restaurant menu (vanilla.ps style categories)
USE vanilla_db;

DELETE FROM Branch_Product WHERE branch_id = 1;

INSERT INTO Product (product_name, product_category, product_price, product_description) VALUES
('Full English Breakfast',  'BreakFast',     38.00, 'Eggs, beans, toast and grilled tomato'),
('Shakshuka',             'BreakFast',     32.00, 'Poached eggs in spiced tomato sauce'),
('Pancakes & Maple',      'BreakFast',     28.00, 'Fluffy pancakes with maple syrup'),
('Hummus Plate',          'Starters',      18.00, 'Creamy hummus with warm pita'),
('Garlic Bread',          'Starters',      14.00, 'Toasted bread with garlic butter'),
('Soup of the Day',       'Starters',      16.00, 'Chef special daily soup'),
('Caesar Salad',          'Salads',        26.00, 'Romaine, parmesan and croutons'),
('Greek Salad',           'Salads',        24.00, 'Feta, olives, cucumber and tomato'),
('Quinoa Power Salad',    'Salads',        28.00, 'Quinoa with roasted vegetables'),
('Classic Beef Burger',   'Burger',        35.00, 'Angus beef with cheddar and fries'),
('Chicken Burger',        'Burger',        32.00, 'Grilled chicken with avocado'),
('Veggie Burger',         'Burger',        30.00, 'Plant-based patty with fresh greens'),
('Spaghetti Bolognese',   'Pasta',         36.00, 'Rich meat sauce over spaghetti'),
('Alfredo Pasta',         'Pasta',         34.00, 'Creamy parmesan sauce'),
('Pesto Penne',           'Pasta',         33.00, 'Basil pesto with cherry tomatoes'),
('Margherita Pizza',      'Pizza',         38.00, 'Tomato, mozzarella and basil'),
('Pepperoni Pizza',       'Pizza',         42.00, 'Spicy pepperoni and cheese'),
('Four Cheese Pizza',     'Pizza',         40.00, 'Blend of four cheeses'),
('Chicken Teriyaki',      'International', 44.00, 'Glazed chicken with steamed rice'),
('Fish & Chips',          'International', 42.00, 'Crispy fish with golden fries'),
('Beef Stir Fry',         'International', 46.00, 'Wok-tossed beef and vegetables'),
('Grilled Ribeye',        'Meats',         68.00, '300g ribeye with side vegetables'),
('Lamb Chops',            'Meats',         72.00, 'Herb-marinated lamb chops'),
('Mixed Grill Platter',   'Meats',         85.00, 'Selection of grilled meats'),
('Classic Om Ali',        'Om Ali',        22.00, 'Traditional Egyptian dessert'),
('Om Ali with Nuts',      'Om Ali',        26.00, 'Om Ali topped with mixed nuts'),
('Double Apple',          'hookah',        45.00, 'Classic double apple flavour'),
('Mint & Grape',          'hookah',        45.00, 'Refreshing mint and grape mix'),
('Watermelon',            'hookah',        45.00, 'Sweet watermelon flavour');

INSERT INTO Branch_Product (branch_id, product_id, is_available, branch_price)
SELECT 1, product_id, TRUE, product_price
FROM Product
WHERE product_name IN (
    'Full English Breakfast', 'Shakshuka', 'Pancakes & Maple',
    'Hummus Plate', 'Garlic Bread', 'Soup of the Day',
    'Greek Salad', 'Quinoa Power Salad',
    'Classic Beef Burger', 'Chicken Burger', 'Veggie Burger',
    'Spaghetti Bolognese', 'Alfredo Pasta', 'Pesto Penne',
    'Margherita Pizza', 'Pepperoni Pizza', 'Four Cheese Pizza',
    'Chicken Teriyaki', 'Fish & Chips', 'Beef Stir Fry',
    'Grilled Ribeye', 'Lamb Chops', 'Mixed Grill Platter',
    'Classic Om Ali', 'Om Ali with Nuts',
    'Double Apple', 'Mint & Grape', 'Watermelon'
)
OR (product_name = 'Caesar Salad' AND product_category = 'Salads');

SELECT p.product_category, COUNT(*) AS items
FROM Branch_Product bp
JOIN Product p ON bp.product_id = p.product_id
WHERE bp.branch_id = 1
GROUP BY p.product_category
ORDER BY FIELD(p.product_category,
    'BreakFast', 'Starters', 'Salads', 'Burger', 'Pasta',
    'Pizza', 'International', 'Meats', 'Om Ali', 'hookah');
