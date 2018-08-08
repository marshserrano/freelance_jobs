class Message < ApplicationRecord
   belongs_to :job_post, class_name: "JobPost", foreign_key: "job_post_id"
   belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
   belongs_to :sender, class_name: "User", foreign_key: "sender_id"

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
