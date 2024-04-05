class BikeCart < ApplicationRecord
  belongs_to :bike
  belongs_to :cart

  def self.ransackable_attributes(auth_object = nil)
    ["bike_id", "cart_id", "created_at", "id", "id_value", "updated_at"]
  end
end
