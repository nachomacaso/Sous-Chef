class Measurement < ApplicationRecord
  has_many :pantry_ingredients
  has_many :recipe_ingredients
end
