class CreateBikeShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :bike_shipments do |t|
      t.integer :bike_id
      t.integer :shipment_id
      t.integer :quantity

      t.timestamps
    end
  end
end
