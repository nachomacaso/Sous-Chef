class RecipeIngredientsController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def index
    @url_string = ""
    user_pantry_ingredients = PantryIngredient.where(user_id: current_user.id)
    @array_length = user_pantry_ingredients.length
    counter = 0
    user_pantry_ingredients.each do |user_pantry_ingredient|
      counter += 1
      if counter == @array_length
        @url_string = @url_string + user_pantry_ingredient.ingredient.name.downcase
      else
        @url_string = @url_string + user_pantry_ingredient.ingredient.name.downcase + '%2C'
      end
    end
    @url_string = @url_string.squish.tr(' ', '+')

    @recipes = Unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?fillIngredients=true&ingredients=#{@url_string}&limitLicense=true&number=1000&ranking=1",
                           headers: {"X-Mashape-Key" => "#{ ENV["mashape_key"]}", "Accept" => "application/json"}).body

    @green_light_recipes = []
    @yellow_light_recipes = []

    @recipes.each do |recipe|
      if recipe["missedIngredientCount"].zero? && recipe["missedIngredients"].length < 3
        unless recipe["image"].nil?
          @green_light_recipes << recipe
          @green_light_recipes = @green_light_recipes.sample(8)
        end
      elsif (recipe["usedIngredients"].length.to_f / (recipe["usedIngredients"].length + recipe["missedIngredients"].length)) >= 0.75 && recipe["missedIngredients"].length <= 5
        unless recipe["image"].nil? 
          @yellow_light_recipes << recipe
          @yellow_light_recipes = @yellow_light_recipes.sample(8)
          @yellow_missing = recipe["missedIngredients"].length
        end
      end
    end
  end

  def create
    @recipe = Unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:id]}/information?includeNutrition=false",
                          headers: {"X-Mashape-Key" => "#{ ENV["mashape_key"]}", "Accept" => "application/json"}).body
    cook_book_recipe = Recipe.find_or_create_by(name: @recipe["title"],
                                                directions: @recipe["instructions"],
                                                spoonacular_id: @recipe["id"],
                                                image: @recipe["image"])

    user_cookbook = CookBook.find_or_create_by(user_id: current_user.id)

    @user_saved_recipe = CookBookRecipe.create(recipe_id: cook_book_recipe.id,
                                               cook_book_id: user_cookbook.id,
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
    @recipe = Unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:id]}/information?includeNutrition=false",
                          headers: {"X-Mashape-Key" => "#{ ENV["mashape_key"]}", "Accept" => "application/json"}).body

    @recipe_ingredients = @recipe["extendedIngredients"]

    @directions = Unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:id]}/analyzedInstructions?stepBreakdown=true",
                              headers: {"X-Mashape-Key" => "#{ ENV["mashape_key"]}", "Accept" => "application/json"}).body

    cookbook = CookBook.find_or_create_by(user_id: current_user.id)

    user_recipe = Recipe.find_by(spoonacular_id: @recipe["id"])
    if user_recipe
      @user_cookbook = CookBookRecipe.find_by("cook_book_id = ? AND recipe_id = ?", cookbook.id, user_recipe.id)
      @contained_in_cook_book = true
    else
      @contained_in_cook_book = false
    end
  end

  def destroy
    recipe = Recipe.find_by(spoonacular_id: params[:id])
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
