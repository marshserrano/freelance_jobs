class InvitationsController < ApplicationController
  def index
    @invitations = Message.where("sender_id = ? OR recipient_id = ?", current_user.id, @recipient)
  end

  def new
    @invitation = Message.new
    @freelancer = User.where(user_type: 'Freelancer')
    @job_post = JobPost.where(status: 'open')
  end

end
