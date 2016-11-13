class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :directions, presence: true
  validates :spoonacular_id, presence: true
  validates :image, presence: true

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :cook_book_recipes
  has_many :cook_books, through: :cook_book_recipes
end
