class RecipeIngredientsController < ApplicationController
  def home
  end

  def index
    @url_string = ""
    user_pantry_ingredients = PantryIngredient.where(user_id: current_user.id)
    if user_pantry_ingredients.any?
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
        if recipe["missedIngredientCount"].zero? && recipe["missedIngredients"].length <= 3
          unless recipe["image"].nil?
            @green_light_recipes << recipe
          end
        elsif (recipe["usedIngredients"].length.to_f / (recipe["usedIngredients"].length + recipe["missedIngredients"].length)) >= 0.50 && recipe["missedIngredients"].length <= 5
          unless recipe["image"].nil? 
            @yellow_light_recipes << recipe
            @yellow_missing = recipe["missedIngredients"].length
          end
        end
      end
    else
      flash[:danger] = 'You need to add more ingredients to you pantry!'
      redirect_to '/pantry/new'
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

    if @user_saved_recipe.rating != nil
      flash[:success] = 'Successfully added a new recipe to cook book!'
      redirect_to '/cookbook'
    else
      flash[:danger] = 'Recipe not saved! Please rate the recipe!'
      cook_book_recipe.destroy
      redirect_to '/recipes'
    end
  end

  def show
    @recipe = Unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:id]}/information?includeNutrition=true",
                          headers: {"X-Mashape-Key" => "#{ ENV["mashape_key"]}", "Accept" => "application/json"}).body

    @directions = Unirest.get("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{params[:id]}/analyzedInstructions?stepBreakdown=true",
                              headers: {"X-Mashape-Key" => "#{ ENV["mashape_key"]}", "Accept" => "application/json"}).body

    @recipe_ingredients = @recipe["extendedIngredients"]

    @missing_ingredients = []
    kitchen_ingredients = []
    spoonacular_ingredients = []
    user_pantry_ingredients = PantryIngredient.where(user_id: current_user.id)
    user_pantry_ingredients.each do |user|
      kitchen_ingredients << user.ingredient.name.downcase
    end
    @recipe_ingredients.each do |recipe|
      spoonacular_ingredients << recipe["name"]
    end
    kitchen_ingredients.each do |kitchen_ingredient|
      spoonacular_ingredients.each do |spoonacular_ingredient|
        if spoonacular_ingredient.include?(kitchen_ingredient.to_s)
          @missing_ingredients << spoonacular_ingredient
        end
      end
    end
    @missing_ingredients = spoonacular_ingredients - @missing_ingredients

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
    user_removed_recipe = Recipe.find_by(spoonacular_id: params[:id])
    user_removed_cookbook = CookBookRecipe.find_by(recipe_id: user_removed_recipe.id)
    user_removed_cookbook.destroy
    user_removed_recipe.destroy

    if user_removed_cookbook && user_removed_recipe
      flash[:success] = 'Successfully removed recipe from cook book!'
      redirect_to "/cookbook"
    else
      flash[:danger] = 'Recipe not removed!'
      redirect_to '/recipes'
    end
  end
end
