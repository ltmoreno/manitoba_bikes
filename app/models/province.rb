class Province < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :customers

  def self.ransackable_associations(auth_object = nil)
    ["customers"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "gst", "hst", "id", "id_value", "name", "pst", "tax_type", "updated_at"]
  end
end