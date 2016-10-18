class AddAisleToIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :ingredients, :aisle, :string
  end
end
