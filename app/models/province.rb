class Province < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :customers
end