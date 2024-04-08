class Bike < ApplicationRecord
  paginates_per 10
  has_many :bike_orders
  has_many :bike_carts
  has_many :bike_shipments
  belongs_to :brand
  belongs_to :category
  validates :model, presence: true
  has_one_attached :photo do |img|
    img.variant :thumb, resize_to_limit: [100,100], preprocessed: true
  end

  def self.ransackable_attributes(auth_object = nil)
    ["brand_id", "category_id", "color", "created_at", "description", "id", "id_value", "model", "price", "updated_at", "photo", "photo_attachment_id", "photo_blob_id_eq"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["bike_carts", "bike_orders", "bike_shipments", "brand", "category"]
  end
end
