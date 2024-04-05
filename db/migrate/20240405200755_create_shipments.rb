class CreateShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :shipments do |t|
      t.string :shipping_number
      t.date :date

      t.timestamps
    end
  end
end
