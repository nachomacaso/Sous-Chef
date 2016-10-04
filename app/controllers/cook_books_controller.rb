class CookBooksController < ApplicationController
  def index
    cook_book_recipes = Recipe.uniq.pluck(:cook_book_id)

    @user_cook_books = Recipe.where(cook_book_id: cook_book_recipes)
  end

  def create
    @cook_book = CookBook.create(user_id: current_user.id)

    if @cook_book.save
      flash[:success] = 'Successfully added a new recipe to cook book!'
      redirect_to '/cookbook'
    else
      flash[:danger] = 'Recipe not saved!'
      render '/recipes'
    end
  end
end
