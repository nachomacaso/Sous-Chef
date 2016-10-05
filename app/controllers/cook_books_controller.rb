class CookBooksController < ApplicationController
  def index
    user_cook_book_id = CookBook.find_by(user_id: current_user.id)
    @user_cook_books = Recipe.where(cook_book_id: user_cook_book_id)
  end

  def update
    user_cookbook = CookBook.find_by(user_id: current_user.id)

    @recipe = Recipe.find(params[:id])
    user_saved_recipe = @recipe.update(cook_book_id: nil)

    if user_saved_recipe
      flash[:success] = 'Successfully added a new recipe to cook book!'
      redirect_to '/cookbook'
    else
      flash[:danger] = 'Recipe not saved!'
      redirect_to '/recipes'
    end
  end
end