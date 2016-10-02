Ingredient.create!([
  {name: "Apples"},
  {name: "Pork"},
  {name: "Cinnamon"},
  {name: "Thyme"},
  {name: "Salt"},
  {name: "Pepper"}
])
PantryIngredient.create!([
  {ingredient_id: 1, user_id: 1, measurement: 1},
  {ingredient_id: 2, user_id: 1, measurement: 2},
  {ingredient_id: 3, user_id: 1, measurement: 3},
  {ingredient_id: 4, user_id: 1, measurement: 3},
  {ingredient_id: 5, user_id: 1, measurement: 2},
  {ingredient_id: 6, user_id: 1, measurement: 1}
])
Recipe.create!([
  {cook_book_id: 1, rating: 5, name: "Winner Winner Chicken Dinner"},
  {cook_book_id: 2, rating: 5, name: "Chicken and Veggies"}
])
RecipeIngredient.create!([
  {recipe_id: 1, ingredient_id: 1, measurement: 1},
  {recipe_id: 1, ingredient_id: 2, measurement: 1},
  {recipe_id: 1, ingredient_id: 3, measurement: 1},
  {recipe_id: 1, ingredient_id: 4, measurement: 1},
  {recipe_id: 2, ingredient_id: 3, measurement: 1},
  {recipe_id: 2, ingredient_id: 4, measurement: 1},
  {recipe_id: 2, ingredient_id: 5, measurement: 1},
  {recipe_id: 2, ingredient_id: 6, measurement: 1}
])
User.create!([
  {name: "nate", email: "nate@gmail.com", password_digest: "$2a$10$4gSUVfClee6sWC6PhE6CZODyjxobvl/1W02NfP5JOTJ5cgs4521hO"}
])
