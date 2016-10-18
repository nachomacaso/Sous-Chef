class AddMeasurementIdToRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :recipe_ingredients, :measurement_id, :integer
  end
end
