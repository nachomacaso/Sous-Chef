class RecipeIngredientsController < ApplicationController
  def index
    pantry_ingredients = PantryIngredient.pluck(:ingredient_id)
    recipe_ingredients = RecipeIngredient.where(ingredient_id: pantry_ingredients)
    matching_ingredients = recipe_ingredients.map(&:recipe_id) # same as { |recipes_ingredient| recipes_ingredient.recipe_id }
    green_light_recipes = []
    green_light_recipes << matching_ingredients.select { |x| matching_ingredients.count(x) > 7 }.uniq
    @green_recipes = Recipe.where(id: green_light_recipes)

    yellow_light_recipes = []
    yellow_light_recipes << matching_ingredients.select { |x| matching_ingredients.count(x) > 2 && matching_ingredients.count(x) < 7 }.uniq
    @yellow_recipes = Recipe.where(id: yellow_light_recipes)
  end

  def show
    @recipe = Recipe.find(params[:id])

    @pantry_ingredients = PantryIngredient.pluck(:ingredient_id)
  end
end
