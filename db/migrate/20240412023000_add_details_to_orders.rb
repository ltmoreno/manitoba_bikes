class AddDetailsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :full_address, :string
    add_column :orders, :gst, :decimal
    add_column :orders, :pst, :decimal
    add_column :orders, :hst, :decimal
    add_column :orders, :status, :string, :null => false, :default => "new"
  end
end
