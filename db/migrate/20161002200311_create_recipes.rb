class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.integer :cook_book_id
      t.integer :rating
      t.string :name

      t.timestamps
    end
  end
end
