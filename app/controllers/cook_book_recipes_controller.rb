class CookBookRecipesController < ApplicationController
  def index
    user_cook_book = CookBook.find_by(user_id: current_user.id)
    if user_cook_book
      @cook_book_recipes = CookBookRecipe.where(cook_book_id: user_cook_book.id).sort_by(&:rating).reverse
    else
      flash[:danger] = 'No recipes saved to cookbook!'
      redirect_to '/recipes'
    end
  end
end
