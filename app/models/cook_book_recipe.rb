class CookBookRecipe < ApplicationRecord
  validates :rating, presence: true
  validates :recipe_id, presence: true
  validates :cook_book_id, presence: true

  belongs_to :recipe
  belongs_to :cook_book
end
