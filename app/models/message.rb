class Message < ApplicationRecord
   belongs_to :job_post, class_name: "JobPost", foreign_key: "job_post_id"
   belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
   belongs_to :sender, class_name: "User", foreign_key: "sender_id"

   scope :pending, -> { where(status: "pending") }

   scope :sender_or_reciever, -> (sender_id, recipient_id) do
     where("sender_id = ? OR recipient_id = ?", sender_id, recipient_id)
   end

   def accepted?
     self.status == 'accepted'
   end

   def declined?
     self.status == 'declined'
   end

   def completed?
     self.status == 'completed'
   end
end
