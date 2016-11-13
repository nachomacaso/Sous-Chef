class Category < ApplicationRecord
  validates :aisle, presence: true

  has_many :ingredients
end
