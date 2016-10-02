class Category < ApplicationRecord
  has_many :category_ingredients
  has_many :ingredients, through: :category_ingredients
end
