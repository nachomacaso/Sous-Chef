class RemoveAisleFromIngredient < ActiveRecord::Migration[5.0]
  def change
    remove_column :ingredients, :aisle, :string
    add_column :ingredients, :category_id, :integer
  end
end
