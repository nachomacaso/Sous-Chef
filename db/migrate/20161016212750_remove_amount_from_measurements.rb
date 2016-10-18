class RemoveAmountFromMeasurements < ActiveRecord::Migration[5.0]
  def change
    remove_column :measurements, :amount, :decimal
  end
end
