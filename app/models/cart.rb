class Cart < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :bike_carts
  has_many :bikes, through: :bike_carts
end
