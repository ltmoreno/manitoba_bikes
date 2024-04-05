class CreateBikeOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :bike_orders do |t|
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :tax_rate

      t.timestamps
    end
  end
end
