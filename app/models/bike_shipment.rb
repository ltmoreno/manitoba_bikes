class BikeShipment < ApplicationRecord
  belongs_to :shipment
  belongs_to :bike

  def self.ransackable_attributes(auth_object = nil)
    ["bike_id", "created_at", "id", "id_value", "quantity", "shipment_id", "updated_at"]
  end
end
