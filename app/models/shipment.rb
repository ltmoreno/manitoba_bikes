class Shipment < ApplicationRecord
  has_many :bike_shipments
  has_many :bikes, through: :bike_shipments
  validates :shipping_number, presence: true, uniqueness: true
end
