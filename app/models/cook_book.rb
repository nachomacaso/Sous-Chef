class CookBook < ApplicationRecord
  validates :user_id, presence: true

  belongs_to :user
  has_many :cook_book_recipes
  has_many :recipes, through: :cook_book_recipes
end
