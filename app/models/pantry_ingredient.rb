class PantryIngredient < ApplicationRecord
  validates :ingredient_id, presence: true
  validates :user_id, presence: true
  validates :measurement_id, presence: true
  validates :amount, presence: true

  belongs_to :ingredient
  belongs_to :user
  belongs_to :measurement
end
