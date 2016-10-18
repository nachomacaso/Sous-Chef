class AddSpoonacularIdToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :spoonacular_id, :integer
    add_column :cook_book_recipes, :recipe_id, :integer
    remove_column :cook_book_recipes, :spoonacular_id, :integer
  end
end
