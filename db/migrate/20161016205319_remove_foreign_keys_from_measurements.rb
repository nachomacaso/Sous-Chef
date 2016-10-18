class RemoveForeignKeysFromMeasurements < ActiveRecord::Migration[5.0]
  def change
    remove_column :measurements, :pantry_ingredient_id, :integer
    remove_column :measurements, :recipe_ingredient_id, :integer
  end
end
