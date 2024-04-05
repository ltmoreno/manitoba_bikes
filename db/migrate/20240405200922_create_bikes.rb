class CreateBikes < ActiveRecord::Migration[7.1]
  def change
    create_table :bikes do |t|
      t.integer :brand_id
      t.string :model
      t.integer :category_id
      t.string :color
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
