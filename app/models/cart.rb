class Cart < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :bike_carts
  has_many :bikes, through: :bike_carts

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "customer_id", "id", "id_value", "updated_at"]
  end
end
