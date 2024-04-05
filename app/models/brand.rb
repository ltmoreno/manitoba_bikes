class Brand < ApplicationRecord
  has_many :bikes
  validates :name, presence: true, uniqueness: true
end
