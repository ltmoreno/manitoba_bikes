class Customer < ApplicationRecord
  validates :firstname, :lastname, :password, :email, :address, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :orders
  belongs_to :province
end
