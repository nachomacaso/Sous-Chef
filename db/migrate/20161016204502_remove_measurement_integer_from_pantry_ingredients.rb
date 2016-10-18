class RemoveMeasurementIntegerFromPantryIngredients < ActiveRecord::Migration[5.0]
  def change
    remove_column :pantry_ingredients, :measurement, :integer
  end
end
