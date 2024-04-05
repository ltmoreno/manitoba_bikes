class Customer < ApplicationRecord
  validates :firstname, :lastname, :password, :email, :address, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :orders
  belongs_to :province

  def self.ransackable_attributes(auth_object = nil)
    ["address", "birthday", "created_at", "email", "first_name", "id", "id_value", "lastname", "password", "province_id", "updated_at"]
  end
end
