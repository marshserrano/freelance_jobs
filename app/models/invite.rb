class Invite < ApplicationRecord
  enum status: [:pending, :accepted, :declined]

  belongs_to :post, class_name: "Post", foreign_key: "post_id"
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"

  scope :pending_or_declined, -> { where(status: ["pending", "declined"]) }
end
