class RemoveTaxRateFromBikeOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :bike_orders, :tax_rate, :decimal
  end
end
