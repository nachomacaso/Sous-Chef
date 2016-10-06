class RemoveCookBookIdFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :cook_book_id, :integer
  end
end
