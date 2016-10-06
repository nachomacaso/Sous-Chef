class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :cook_book_recipes
  has_many :cook_books, through: :cook_book_recipes
end
