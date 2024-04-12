class Order < ApplicationRecord
  has_many :bike_orders
  belongs_to :customer

  def self.ransackable_associations(auth_object = nil)
    ["bike_orders", "customer"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "customer_id", "date", "full_address", "gst", "hst", "id", "id_value", "pst", "status", "updated_at"]
  end
end
