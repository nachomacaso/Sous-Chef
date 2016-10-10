class CookBookRecipesController < ApplicationController
  def index
    user_cook_book = CookBook.find_by(user_id: current_user.id)
    @cook_book_recipes = CookBookRecipe.where(cook_book_id: user_cook_book.id).sort_by(&:rating).reverse
  end
end
