class CreatePantryIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :pantry_ingredients do |t|
      t.integer :ingredient_id
      t.integer :user_id

      t.timestamps
    end
  end
end
