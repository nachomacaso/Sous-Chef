class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :phone, presence: true

  has_secure_password
  has_many :pantry_ingredients
  has_many :ingredients, through: :pantry_ingredients
end
