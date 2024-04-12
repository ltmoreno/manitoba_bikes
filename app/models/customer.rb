class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy

  validates :first_name, :lastname, :address, :email, :password, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :orders
  has_many :bike_orders, through: :orders
  belongs_to :province
  has_one :cart

  def fullname
    "#{first_name} #{lastname}"
  end

  def full_address
    "#{address}, #{province.name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["address", "birthday", "created_at", "email", "encrypted_password", "first_name", "id", "id_value", "lastname", "province_id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["cart", "orders", "province", "tasks"]
  end
end
