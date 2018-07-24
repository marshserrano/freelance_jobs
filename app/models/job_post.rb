class JobPost < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true

end
