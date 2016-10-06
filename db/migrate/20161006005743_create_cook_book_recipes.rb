class CreateCookBookRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :cook_book_recipes do |t|
      t.integer :recipe_id
      t.integer :cook_book_id
      t.integer :rating

      t.timestamps
    end
  end
end
