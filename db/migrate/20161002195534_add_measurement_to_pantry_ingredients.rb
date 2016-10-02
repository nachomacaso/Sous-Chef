class AddMeasurementToPantryIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :pantry_ingredients, :measurement, :integer
  end
end
