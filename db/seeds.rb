Ingredient.create!([
  {name: "Chicken"}, {name: "Apples"}
])
PantryIngredient.create!([
  {ingredient_id: 1, user_id: 1}, {ingredient_id: 2, user_id: 1}
])
User.create!([
  {name: "nate", email: "nate@gmail.com", password_digest: "$2a$10$4gSUVfClee6sWC6PhE6CZODyjxobvl/1W02NfP5JOTJ5cgs4521hO"}
])
