class Todo < ApplicationRecord
  belongs_to :user
  default_scope -> { order(:order) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
end
