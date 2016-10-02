class CreateCookBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :cook_books do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
