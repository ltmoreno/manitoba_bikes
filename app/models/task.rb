class Task < ApplicationRecord
  belongs_to :customer

  enum :status, { draft: 0, underway: 1, done: 2, archived: 3 }

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "customer_id", "id", "id_value", "status", "title", "updated_at"]
  end
end
