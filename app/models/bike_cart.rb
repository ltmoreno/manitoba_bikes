class BikeCart < ApplicationRecord
  belongs_to :cart
  belongs_to :bike
  attribute :quantity, :integer, default: 0

  def self.ransackable_attributes(auth_object = nil)
    ["bike_id", "cart_id", "created_at", "id", "id_value", "updated_at"]
  end
end
