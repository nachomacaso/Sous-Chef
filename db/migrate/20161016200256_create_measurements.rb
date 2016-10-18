class CreateMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :measurements do |t|
      t.string :unit
      t.decimal :amount
      t.integer :pantry_ingredient_id
      t.integer :recipe_ingredient_id

      t.timestamps
    end
  end
end
