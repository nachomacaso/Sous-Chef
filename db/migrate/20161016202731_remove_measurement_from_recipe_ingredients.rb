class RemoveMeasurementFromRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipe_ingredients, :measurement, :integer
  end
end
