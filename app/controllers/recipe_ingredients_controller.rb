class RecipeIngredientsController < ApplicationController
  before_action :authenticate_user!

  def index
    recipes = Recipe.all

    ingredients_per_recipe = {}
    recipes.each do |recipe|
      ingredients_per_recipe[recipe.id] = recipe.recipe_ingredients.count
    end

    user_pantry_ingredient_ids = PantryIngredient.where(user_id: current_user.id).pluck(:ingredient_id)

    pantry_ingredients_per_recipe = {}
    recipes.each do |recipe|
      pantry_ingredients_per_recipe[recipe.id] = recipe.recipe_ingredients.where(ingredient_id: user_pantry_ingredient_ids).count
    end

    percent_completed = ingredients_per_recipe.merge(pantry_ingredients_per_recipe){ |key, recipe_ingredient_count, pantry_ingredient_count| (pantry_ingredient_count.to_f / recipe_ingredient_count) }

    green_light_recipes = []
    yellow_light_recipes = []
    red_light_recipes = []
    percent_completed.each do |recipe_id, percent_complete|
      if percent_complete == 1
        green_light_recipes << recipe_id
      elsif percent_complete >= 0.75 && percent_complete < 1
        yellow_light_recipes << recipe_id
      elsif percent_complete < 0.75
        red_light_recipes << recipe_id
      end
    end
        
    @green_recipes = Recipe.where(id: green_light_recipes)
    @yellow_recipes = Recipe.where(id: yellow_light_recipes)
    @red_recipes = Recipe.where(id: red_light_recipes)
  end

  def create
    recipe = Recipe.find(params[:id])
    cookbook = CookBook.find_or_create_by(user_id: current_user.id)

    @user_saved_recipe = CookBookRecipe.create(recipe_id: recipe.id,
                                               cook_book_id: cookbook.id,
                                               rating: params[:rating])

    if @user_saved_recipe
      flash[:success] = 'Successfully added a new recipe to cook book!'
      redirect_to '/cookbook'
    else
      flash[:danger] = 'Recipe not saved!'
      redirect_to '/recipes'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    cookbook = CookBook.find_or_create_by(user_id: current_user.id)

    @user_cookbook = CookBookRecipe.find_by("cook_book_id = ? AND recipe_id = ?", cookbook.id, @recipe.id)

    if @user_cookbook
      @contained_in_cook_book = true
    else
      @contained_in_cook_book = false
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    user_removed_cookbook = CookBookRecipe.find_by(recipe_id: recipe.id)
    user_removed_cookbook.destroy

    if user_removed_cookbook
      flash[:success] = 'Successfully removed recipe from cook book!'
      redirect_to "/cookbook"
    else
      flash[:danger] = 'Recipe not removed!'
      redirect_to '/recipes'
    end
  end
end
