Category.create!([
  {aisle: "Milk, Eggs, Other Dairy"},
  {aisle: "Oil, Vinegar, Salad Dressing"},
  {aisle: "Spices and Seasonings"},
  {aisle: "Baking"},
  {aisle: "Produce"},
  {aisle: "Pasta and Rice"},
  {aisle: "Canned and Jarred"},
  {aisle: "Cheese"},
  {aisle: "Meat"}
])
CookBook.create!([
  {user_id: 1},
  {user_id: 2}
])
CookBookRecipe.create!([
  {cook_book_id: 1, rating: 5, recipe_id: 3},
  {cook_book_id: 1, rating: 4, recipe_id: 4},
  {cook_book_id: 1, rating: 4, recipe_id: 5},
  {cook_book_id: 1, rating: 5, recipe_id: 2},
  {cook_book_id: 1, rating: 3, recipe_id: 1},
  {cook_book_id: 1, rating: 3, recipe_id: 6}
])
Ingredient.create!([
  {name: "Butter", category_id: 1},
  {name: "Apple Cider Vinegar", category_id: 2},
  {name: "Olive Oil", category_id: 2},
  {name: "Dijon Mustard", category_id: 2},
  {name: "Salt", category_id: 3},
  {name: "Pepper", category_id: 3},
  {name: "Sugar", category_id: 3},
  {name: "Papricka", category_id: 3},
  {name: "Cinnamon", category_id: 3},
  {name: "Basil", category_id: 3},
  {name: "Thyme", category_id: 3},
  {name: "Dried Oregano", category_id: 3},
  {name: "Flour", category_id: 4},
  {name: "Panko Bread Crumbs", category_id: 4},
  {name: "Rosemary", category_id: 5},
  {name: "Garlic", category_id: 5},
  {name: "Jalapeno", category_id: 5},
  {name: "Onion", category_id: 5},
  {name: "Tomato", category_id: 5},
  {name: "Potato", category_id: 5},
  {name: "Green Pepper", category_id: 5},
  {name: "Carrots", category_id: 5},
  {name: "Lemon", category_id: 5},
  {name: "Apple", category_id: 5},
  {name: "Cilantro", category_id: 5},
  {name: "Ginger", category_id: 5},
  {name: "Celery", category_id: 5},
  {name: "Taragon", category_id: 5},
  {name: "Sweet Potato", category_id: 5},
  {name: "Fresh Oregano", category_id: 5},
  {name: "Red-Skinned Potatoes", category_id: 5},
  {name: "Spagetti", category_id: 6},
  {name: "Ziti Pasta", category_id: 6},
  {name: "Chicken Stock", category_id: 7},
  {name: "Parmesan Cheese", category_id: 8},
  {name: "Ricotta Cheese", category_id: 8},
  {name: "Romano Cheese", category_id: 8},
  {name: "Eggs", category_id: 1},
  {name: "Heavy Cream", category_id: 1},
  {name: "Ground Beef", category_id: 9},
  {name: "Chicken Breast", category_id: 9},
  {name: "Pork Shoulder", category_id: 9},
  {name: "Skirt Steak", category_id: 9},
  {name: "Sliced Ham", category_id: 9},
  {name: "Brown Rice", category_id: 6},
  {name: "Canned Tomatoes", category_id: 7},
  {name: "Chicken Broth", category_id: 7},
  {name: "Yellow Onion", category_id: 5},
  {name: "Zucchini", category_id: 5},
  {name: "Calliflower", category_id: 5},
  {name: "Lasagna Noodes", category_id: 6},
  {name: "Soy Sauce", category_id: 2},
  {name: "Unsalted Butter", category_id: 1},
  {name: "Mortadella", category_id: 9},
  {name: "Sesame Oil", category_id: 2}
])
Measurement.create!([
  {unit: "serving"},
  {unit: "teaspoon"},
  {unit: "tablespoon"},
  {unit: "cup"},
  {unit: "fluid ounce"},
  {unit: "teaspoon"},
  {unit: "pint"},
  {unit: "quart"},
  {unit: "gallon"},
  {unit: "ounce"},
  {unit: "pound"}
])
PantryIngredient.create!([
  {ingredient_id: 1, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 25, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 16, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 3, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 6, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 26, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 23, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 11, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 10, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 4, user_id: 2, measurement_id: 2, amount: "2.0"},
  {ingredient_id: 1, user_id: 1, measurement_id: 3, amount: "16.0"},
  {ingredient_id: 3, user_id: 1, measurement_id: 9, amount: "1.0"},
  {ingredient_id: 4, user_id: 1, measurement_id: 7, amount: "2.0"},
  {ingredient_id: 5, user_id: 1, measurement_id: 4, amount: "50.0"},
  {ingredient_id: 6, user_id: 1, measurement_id: 4, amount: "30.0"},
  {ingredient_id: 7, user_id: 1, measurement_id: 4, amount: "50.0"},
  {ingredient_id: 8, user_id: 1, measurement_id: 4, amount: "10.0"},
  {ingredient_id: 9, user_id: 1, measurement_id: 4, amount: "5.0"},
  {ingredient_id: 10, user_id: 1, measurement_id: 4, amount: "2.0"},
  {ingredient_id: 11, user_id: 1, measurement_id: 4, amount: "2.0"},
  {ingredient_id: 12, user_id: 1, measurement_id: 3, amount: "5.0"},
  {ingredient_id: 13, user_id: 1, measurement_id: 4, amount: "15.0"},
  {ingredient_id: 14, user_id: 1, measurement_id: 4, amount: "25.0"},
  {ingredient_id: 15, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 16, user_id: 1, measurement_id: 1, amount: "5.0"},
  {ingredient_id: 17, user_id: 1, measurement_id: 1, amount: "2.0"},
  {ingredient_id: 19, user_id: 1, measurement_id: 1, amount: "3.0"},
  {ingredient_id: 20, user_id: 1, measurement_id: 11, amount: "5.0"},
  {ingredient_id: 21, user_id: 1, measurement_id: 1, amount: "2.0"},
  {ingredient_id: 22, user_id: 1, measurement_id: 1, amount: "3.0"},
  {ingredient_id: 23, user_id: 1, measurement_id: 1, amount: "2.0"},
  {ingredient_id: 24, user_id: 1, measurement_id: 1, amount: "2.0"},
  {ingredient_id: 25, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 27, user_id: 1, measurement_id: 1, amount: "5.0"},
  {ingredient_id: 28, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 31, user_id: 1, measurement_id: 1, amount: "5.0"},
  {ingredient_id: 32, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 33, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 35, user_id: 1, measurement_id: 4, amount: "5.0"},
  {ingredient_id: 37, user_id: 1, measurement_id: 4, amount: "5.0"},
  {ingredient_id: 36, user_id: 1, measurement_id: 4, amount: "5.0"},
  {ingredient_id: 38, user_id: 1, measurement_id: 1, amount: "12.0"},
  {ingredient_id: 39, user_id: 1, measurement_id: 8, amount: "1.0"},
  {ingredient_id: 40, user_id: 1, measurement_id: 11, amount: "1.0"},
  {ingredient_id: 41, user_id: 1, measurement_id: 11, amount: "2.0"},
  {ingredient_id: 42, user_id: 1, measurement_id: 11, amount: "8.0"},
  {ingredient_id: 43, user_id: 1, measurement_id: 11, amount: "5.0"},
  {ingredient_id: 45, user_id: 1, measurement_id: 11, amount: "0.25"},
  {ingredient_id: 46, user_id: 1, measurement_id: 4, amount: "5.0"},
  {ingredient_id: 30, user_id: 1, measurement_id: 4, amount: "1.0"},
  {ingredient_id: 47, user_id: 1, measurement_id: 1, amount: "2.0"},
  {ingredient_id: 48, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 49, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 50, user_id: 1, measurement_id: 1, amount: "2.0"},
  {ingredient_id: 51, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 52, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 53, user_id: 1, measurement_id: 1, amount: "1.0"},
  {ingredient_id: 54, user_id: 1, measurement_id: 1, amount: "0.25"},
  {ingredient_id: 55, user_id: 1, measurement_id: 5, amount: "6.0"},
  {ingredient_id: 2, user_id: 1, measurement_id: 5, amount: "8.0"}
])
Recipe.create!([
  {name: "Potato-Cheese Pie", directions: "<ol><li>Make the crust: Pulse the flour, sugar and salt in a food processor. Add 1 stick butter and pulse until combined. Add the remaining 2 sticks butter and pulse three times, or until the mixture resembles coarse meal. Add the vinegar, then gradually add 1/3 cup ice water through the feed tube, pulsing four times, until evenly combined. Squeeze the dough between your fingers. If it doesnt hold its shape, add up to 2 tablespoons ice water and pulse two more times (the dough should still be crumbly). Turn out onto a clean surface and press into a ball; divide in half, wrap in plastic wrap and flatten into two 1-inch-thick rectangles. Refrigerate at least 1 hour or up to 2 days.</li><li>Make the filling: Heat 2 tablespoons olive oil in a skillet over medium heat. Add the onion and cook until slightly brown, 5 to 7 minutes; season with salt and let cool. Slice the potatoes and apples very thinly; toss in a bowl with the thyme, the remaining 2 tablespoons olive oil, and salt and pepper to taste.</li><li>Line an 8-inch square baking dish with foil, leaving a 1-inch overhang on all sides. On a floured surface, roll out one piece of dough into a 12-inch square, about 1/8-inch thick. Transfer to the prepared dish, tucking the dough into the edges and corners; do not trim the overhang. Sprinkle the breadcrumbs over the dough and add the onion. Lay the mortadella on top, then sprinkle with about one-third of the cheese. Layer half of the potatoes and apples on top in a single layer, then sprinkle with another one-third of the cheese. Top with the remaining potatoes, apples and cheese.</li><li>Roll the remaining dough into a 12-inch square and place on top of the filling. Press the overhang of the two crusts together, then roll the dough under itself and pinch to make a 3/4-inch-high edge. Make slits in the top crust with a knife to allow steam to escape. Refrigerate 30 minutes. Meanwhile, preheat the oven to 425 degrees F.</li><li>Bake the pie until golden brown, about 30 minutes. Reduce the oven temperature to 400 degrees F, brush the crust with cream and continue baking until crisp, about 35 more minutes. Cool 25 minutes, then lift out of the pan and slice.</li></ol>", spoonacular_id: 657011, image: "https://spoonacular.com/recipeImages/Potato-Cheese-Pie-657011.jpg"},
  {name: "Carrot and Ginger Soup", directions: "<ol><li>In a Dutch oven or stockpot, heat the olive oil over medium heat. Add the onion and celery, and cook, stirring occasionally, until translucent, 4 to 5 minutes.</li><li>Add the garlic and ginger. Cook until fragrant, about 1 minute.</li><li>Add the vegetable broth, carrots, sweet potato, thyme sprigs, salt, and pepper. Bring to a boil and reduce to a simmer. Cover and cook over low heat until vegetables start to break down, 40 to 45 minutes.</li><li>Blend with an immersion blender for desired consistency. Serve immediately. The soup may be refrigerated in airtight containers for up to 4 days or in the freezer for up to 2 months.</li></ol>", spoonacular_id: 637165, image: "https://spoonacular.com/recipeImages/Carrot-and-Ginger-Soup-637165.jpg"},
  {name: "Baked Pasta With Tomato Sauce and Cheese", directions: "<ol><li>Saute the onion and garlic in the olive oil for about 5 minutes, or until the onion is softened. Add tomatoes and spices. Simmer sauce for 25-30 minutes. Boil and drain the ziti or other noodles. Put the pasta back in the empty cooking pot and add the butter, then the Parmesan cheese. Toss well in mix. Layer the ingredients in a large, greased casserole as follows: ziti, noodles, ricotta cheese, tomato sauce, Romano cheese, and repeat in the same order until you've used them all up. Bake at 375F for 25-30 minutes.</li></ol>", spoonacular_id: 633718, image: "https://spoonacular.com/recipeImages/Baked-Pasta-With-Tomato-Sauce-and-Cheese-633718.jpg"},
  {name: "Asparagus and Asiago Frittata", directions: "<ol><li>In a large bowl, combine the eggs, whipping cream, salt, pepper, and half the fresh thyme. Beat with a whisk until the eggs and cream are incorporated.</li><li>In an ovenproof saut pan over medium heat, add the butter and olive oil. When the mixture is hot, add the asparagus pieces and cook for 3-4 minutes, stirring. Add the garlic and cook for about a minute. Spread the asparagus so it is evenly distributed across the bottom of the pan.</li><li>Add the egg mixture to the pan and allow the eggs to cook without mixing them. Use a rubber spatula to run around the edges of the frittata as it cooks so the edges dont stick and burn. After 1-2 minutes, add the cheese evenly to the egg mixture.</li><li>When the outer edges of the frittata have set but the center is still slightly runny, arrange the cherry tomatoes and asparagus spears on the top of the frittata, sprinkle the remaining thyme over the top, then remove the pan from the heat and place it in an oven set to broil.</li><li>The broiler will allow the top portion of the egg mixture to set and cook thoroughly. Keep a close watch so the frittata doesnt burn.</li><li>After a few minutes, when the eggs have set completely and begin to turn golden, carefully remove the pan from the oven.</li><li>Use a rubber spatula to run around the edges and underside of the frittata, and slide it onto a round serving plate.</li><li>Slice and serve warm or at room temperature.</li></ol>", spoonacular_id: 632925, image: "https://spoonacular.com/recipeImages/Asparagus-and-Asiago-Frittata-632925.jpg"},
  {name: "Savoy Cabbage and Celery Root Soup with Leek Confit", directions: "<ol><li>Heat the olive oil in a heavy pot, such as a Le Creuset, over medium-high heat. Add the onion, celery root, garlic, scallion tops, and leek confit. Saut until the onion softens, about 15 minutes.</li><li>Add the apple, mustard, and rosemary, and cook for another couple of minutes. The mixture will be very aromatic.</li><li>Add the remaining ingredients and bring to a low simmer. Cover and simmer for 40 minutes. Adjust seasoning if needed.</li></ol>", spoonacular_id: 659513, image: "https://spoonacular.com/recipeImages/Savoy-Cabbage-and-Celery-Root-Soup-with-Leek-Confit-659513.jpg"},
  {name: "Chicken in a Basil Cream Sauce", directions: "<ol><li>Cook spaghetti according to directions on package.</li><li>Meanwhile, heat olive oil in skillet over medium high heat. Remove chicken from package and sprinkle with salt and pepper.</li><li>Prepare breading station: In one flat bowl, add 1/2 c. flour, salt and pepper. In another flat bowl, add egg and 1 Tbs. water and mix well. In the third flat bowl, add the panko, 1/2 c. Parmesan cheese, 2 Tbs. chopped basil and salt and pepper.</li><li>Coat each piece of chicken by first dredging in flour mixture, next in egg mixture and finally in panko mixture.</li><li>Fry breaded chicken in oil 4-5 minutes per side.</li><li>While chicken is cooking, add heavy cream to saucepan and heat over medium-medium high heat until a small simmer begins. Immediately add 1/2 c. Parmesan cheese and stir to incorporate cheese.</li><li>Remove from heat and add basil.</li><li>Assemble the dish by placing a serving of pasta on the plate, top with one piece of chicken, pour 1/4 of sauce mixture over the top and sprinkle with 1/4 c. chopped tomato.</li><li>Garnish with additional chopped basil if desired.</li></ol>", spoonacular_id: 638118, image: "https://spoonacular.com/recipeImages/Chicken-in-a-Basil-Cream-Sauce-638118.jpg"}
])
User.create!([
  {name: "nate", email: "nate@gmail.com", password_digest: "$2a$10$4gSUVfClee6sWC6PhE6CZODyjxobvl/1W02NfP5JOTJ5cgs4521hO"},
  {name: "joe", email: "joe@gmail.com", password_digest: "$2a$10$Zz1scXrbc8ejMOgjxXyNDO0YJykfah/VZCojzxK4X8aq2sQxebmKW"}
])
