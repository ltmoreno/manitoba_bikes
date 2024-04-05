class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :lastname
      t.string :email
      t.string :password
      t.date :birthday
      t.string :address
      t.integer :province_id

      t.timestamps
    end
  end
end
