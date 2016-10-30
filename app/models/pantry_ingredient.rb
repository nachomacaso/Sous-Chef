class PantryIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :user
  belongs_to :measurement
  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
