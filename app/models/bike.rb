class Bike < ApplicationRecord
  has_many :bike_orders
  has_many :bike_carts
  has_many :bike_shipments
  belongs_to :brand
  belongs_to :category
  validates :model, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["brand_id", "category_id", "color", "created_at", "description", "id", "id_value", "model", "price", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["bike_carts", "bike_orders", "bike_shipments", "brand", "category"]
  end
end
