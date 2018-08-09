class CompletedJobsController < ApplicationController
  def index
    @completed_jobs = Message.sender_or_reciever(current_user.id, current_user.id)
  end
end
