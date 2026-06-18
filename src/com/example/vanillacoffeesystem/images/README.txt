Put menu photos here (.jpg, .jpeg, or .png)

IMPORTANT: Rename files BEFORE linking them in the database.

Naming rule (snake_case from product name):
  "Pancakes & Maple"  ->  pancakes_maple.jpg
  "Chicken Burger"    ->  chicken_burger.jpg
  "Greek Salad"       ->  greek_salad.jpg

Steps:
  1. Drop photo into this folder
  2. Rename it using the rule above
  3. Run in MySQL:
     UPDATE Product SET image_file = 'yourfile.jpg' WHERE product_name = 'Product Name';
  4. Build -> Rebuild Project, then run the app

Current linked images:

  full_english_breakfast.jpg  ->  Full English Breakfast
  shakshuka.jpg               ->  Shakshuka
  pancakes_maple.jpg          ->  Pancakes & Maple
  chicken_burger.jpg          ->  Chicken Burger
  margherita_pizza.jpg        ->  Margherita Pizza
  pepperoni_pizza.jpg         ->  Pepperoni Pizza
  four_cheese_pizza.jpg       ->  Four Cheese Pizza
  greek_salad.jpg             ->  Greek Salad
  quinoa_power_salad.jpg      ->  Quinoa Power Salad
  garlic_bread.jpg            ->  Garlic Bread
  hummus_plate.jpg            ->  Hummus Plate
  lamb_chops.jpg              ->  Lamb Chops
  mixed_grill_platter.jpg     ->  Mixed Grill Platter
  alfredo_pasta.jpg           ->  Alfredo Pasta
  pesto_penne.jpg             ->  Pesto Penne
  caesar_salad.jpg            ->  Caesar Salad
  grilled_ribeye.jpg          ->  Grilled Ribeye
  spaghetti_bolognese.jpg     ->  Spaghetti Bolognese
  veggie_burger.jpg           ->  Veggie Burger
  classic_beef_burger.jpg     ->  Classic Beef Burger
  grilled_salmon.jpg          ->  Grilled Salmon
  veggie_pizza.jpg              ->  Veggie Pizza
  mankousheh.jpg              ->  Mankousheh
  halloumi_with_kaek_al_quds.jpg ->  Halloumi with Ka'ek Al Quds

Drinks:
  espresso.jpg                ->  Espresso
  latte.jpg                   ->  Latte
  cappuccino.jpg              ->  Cappuccino
  caramel_latte.jpg           ->  Caramel Latte
  cortado.jpg                 ->  Cortado
  americano.jpg               ->  Americano
  flat_white.jpg              ->  Flat White
  macchiato.jpg               ->  Macchiato
  mocha.jpg                   ->  Mocha
  iced_americano.jpg          ->  Iced Americano
  iced_latte.jpg              ->  Iced Latte
  iced_cappuccino.jpg         ->  Iced Cappuccino
  affogato.jpg                ->  Affogato

Desserts:
  baklava_platter.jpg         ->  Baklava Platter
  basbousa.jpg                ->  Basbousa
  cheesecake.jpg              ->  Cheesecake
  chocolate_brownie.jpg       ->  Chocolate Brownie
  chocolate_lava_cake.jpg     ->  Chocolate Lava Cake
  classic_om_ali.jpg          ->  Classic Om Ali
  creme_brulee.jpg            ->  Creme Brulee
  fruit_tart.jpg              ->  Fruit Tart
  kunafa.jpg                  ->  Kunafa
  om_ali_with_nuts.jpg        ->  Om Ali with Nuts
  panna_cotta.jpg             ->  Panna Cotta
  tiramisu.jpg                ->  Tiramisu
  iced_mocha.jpg              ->  Iced Mocha
  fresh_orange_juice.jpg      ->  Fresh Orange Juice
  iced_tea.jpg                ->  Iced Tea
  lemon_mint.jpg              ->  Lemon Mint
  mango_passion.jpg           ->  Mango Passion
  strawberry_refresher.jpg    ->  Strawberry Refresher
  watermelon_cooler.jpg       ->  Watermelon Cooler
