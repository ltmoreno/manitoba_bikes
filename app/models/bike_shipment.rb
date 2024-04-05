class BikeShipment < ApplicationRecord
  belongs_to :shipment
  belongs_to :bike
end
