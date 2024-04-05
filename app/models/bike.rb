class Bike < ApplicationRecord
  has_many :bike_orders
  has_many :bike_carts
  has_many :bike_shipments
  belongs_to :brand
  belongs_to :category
  validates :model, presence: true
end
