class Cart < ApplicationRecord
  has_many :bike_carts
  belongs_to :customer
end
