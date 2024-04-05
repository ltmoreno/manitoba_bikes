class BikeOrder < ApplicationRecord
  belongs_to :bike
  belongs_to :order

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "quantity", "tax_rate", "unit_price", "updated_at"]
  end
end
