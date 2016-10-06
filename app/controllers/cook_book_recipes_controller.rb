class CookBookRecipesController < ApplicationController
  def index
    @cook_book_recipes = CookBookRecipe.all
  end
  def create
    recipe = Recipe.find(params[:id])
    cookbook = CookBook.find_or_create_by(user_id: current_user.id)

    cook_book_recipe = CookBookRecipe.create(recipe_id: recipe.id,
                                             cook_book_id: cookbook.id,
                                             rating: params[:rating])
  end
  def update
    user_cookbook = CookBook.find_or_create_by(user_id: current_user.id)

    @recipe = Recipe.find(params[:id])
    user_saved_recipe = @recipe.update(cook_book_id: user_cookbook.id)

    if user_saved_recipe
      flash[:success] = 'Successfully added a new recipe to cook book!'
      redirect_to '/cookbook'
    else
      flash[:danger] = 'Recipe not saved!'
      redirect_to '/recipes'
    end
  end
end
