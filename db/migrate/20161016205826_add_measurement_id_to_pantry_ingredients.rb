class AddMeasurementIdToPantryIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :pantry_ingredients, :measurement_id, :integer
  end
end
