class JobApplication < ApplicationRecord
  enum status: [:pending, :accepted, :declined, :completed]

  belongs_to :post, class_name: "Post", foreign_key: "post_id"
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  has_many :reviews, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  scope :pending, -> { where(status: "pending") }
end
