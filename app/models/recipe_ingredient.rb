class RecipeIngredient < ApplicationRecord
  validates :recipe_id, presence: true
  validates :ingredient_id, presence: true
  validates :measurement_id, presence: true
  validates :amount, presence: true

  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :measurement
end
