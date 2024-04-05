class Shipment < ApplicationRecord
  has_many :bike_shipments
  validates :shipping_number, presence: true, uniqueness: true
end
