class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true

  has_many :pantry_ingredients
  has_many :users, through: :pantry_ingredients
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  belongs_to :category
end
