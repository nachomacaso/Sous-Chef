class RemoveImagesFromIngredients < ActiveRecord::Migration[5.0]
  def change
    remove_column :pantry_ingredients, :image_file_name, :string
    remove_column :pantry_ingredients, :image_content_type, :string
    remove_column :pantry_ingredients, :image_file_size, :integer
    remove_column :pantry_ingredients, :image_updated_at, :datetime
    remove_column :ingredients, :image_file_name, :string
    remove_column :ingredients, :image_content_type, :string
    remove_column :ingredients, :image_file_size, :integer
    remove_column :ingredients, :image_updated_at, :datetime
  end
end
