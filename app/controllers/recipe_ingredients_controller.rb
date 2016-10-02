class RecipeIngredientsController < ApplicationController
  def index
    pantry_ingredients = PantryIngredient.pluck(:ingredient_id)
    recipe_ingredients = RecipeIngredient.where(ingredient_id: pantry_ingredients)
    matching_ingredients = recipe_ingredients.map(&:recipe_id) # same as { |recipes_ingredient| recipes_ingredient.recipe_id }
    compatible_recipes = []
    compatible_recipes << matching_ingredients.select { |x| matching_ingredients.count(x) > 3 }.uniq
    @recipes = Recipe.where(id: compatible_recipes)
  end
end
