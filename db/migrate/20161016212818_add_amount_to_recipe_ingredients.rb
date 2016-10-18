class AddAmountToRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    add_column :recipe_ingredients, :amount, :decimal, precision: 5, scale: 2
  end
end
