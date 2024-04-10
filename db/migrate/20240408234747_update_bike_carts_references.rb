class UpdateBikeCartsReferences < ActiveRecord::Migration[7.1]
  def change
    # Remove the existing foreign keys
    remove_reference :bike_carts, :bike, foreign_key: true
    remove_reference :bike_carts, :cart, foreign_key: true

    # Add new foreign keys with updated references
    add_reference :bike_carts, :bike, null: false, foreign_key: { to_table: :bikes }
    add_reference :bike_carts, :cart, null: false, foreign_key: { to_table: :carts }
  end
end
