class RemoveRatingFromRecipes < ActiveRecord::Migration[5.0]
  def change
    remove_column :recipes, :rating, :integer
  end
end
