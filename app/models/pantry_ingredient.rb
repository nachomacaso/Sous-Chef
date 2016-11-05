class PantryIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :user
  belongs_to :measurement
end
