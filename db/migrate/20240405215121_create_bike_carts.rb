class CreateBikeCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :bike_carts do |t|
      t.integer :bike_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
