class InvitationsController < ApplicationController
  def index
    @invitations = Message.where("sender_id = ? OR recipient_id = ?", current_user.id, @recipient)
    @invites = Message.where("sender_id = ? OR recipient_id = ?", @sender, current_user.id)
  end

  def new
    @invitation = Message.new
    @freelancer = User.where(user_type: 'Freelancer').order(name: :asc)
    @job_post = current_user.job_posts.where(status: 'open')
  end

  def accept
    @message = Message.find_by(id: params[:id])
    @job_post = JobPost.where(id: @message.job_post_id)
    @message.update(status: "accepted")
    @job_post.update(status: "closed")
    redirect_to invitations_path
  end

  def decline
    @message = Message.find_by(id: params[:id])
    @message.update(status: "declined")
    redirect_to invitations_path
  end
end
