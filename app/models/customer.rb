class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy

  validates :first_name, :lastname, :address, :email, :password, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :orders
  belongs_to :province
  has_one :cart

  def self.ransackable_attributes(auth_object = nil)
    ["address", "birthday", "created_at", "email", "first_name", "id", "id_value", "lastname", "password", "province_id", "updated_at"]
  end
end
