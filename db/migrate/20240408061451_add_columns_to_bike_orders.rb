class AddColumnsToBikeOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :bike_orders, :bike_id, :integer
    add_column :bike_orders, :order_id, :integer
  end
end
