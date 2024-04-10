class AddQuantityToBikeCarts < ActiveRecord::Migration[7.1]
  def change
    add_column :bike_carts, :quantity, :integer
  end
end
