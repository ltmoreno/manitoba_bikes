class Order < ApplicationRecord
  has_many :bike_orders
  belongs_to :customer
end
