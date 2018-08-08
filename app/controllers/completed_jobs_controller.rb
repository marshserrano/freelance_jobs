class CompletedJobsController < ApplicationController
  def index
    @completed_jobs = Message.where("sender_id = ? OR recipient_id = ? OR
                                     recipient_id = ? OR sender_id = ?",
                                     current_user.id, @recipient,
                                     current_user.id, @sender)
  end
end
