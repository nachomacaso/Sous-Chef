class AddAttachmentImageToPantryIngredients < ActiveRecord::Migration
  def self.up
    change_table :pantry_ingredients do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pantry_ingredients, :image
  end
end
