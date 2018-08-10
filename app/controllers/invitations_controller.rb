class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:accept, :decline, :destroy]

  def index
    @invitations = current_user.sent_messages
    @invites = current_user.messages
  end

  def new
    @invitation = Message.new
    @freelancer = User.where(user_type: 'Freelancer').order(name: :asc)
    @job_post = current_user.job_posts.where(status: 'open')
  end

  def accept
    @job_post = JobPost.where(id: @invitation.job_post_id)
    @invitation.update(status: "accepted")
    @job_post.update(status: "closed")
    redirect_to invitations_path
  end

  def decline
    @invitation.update(status: "declined")
    redirect_to invitations_path
  end

  def destroy
    @invitation.destroy
      flash[:success] = "Job invitation was successfully deleted."
      redirect_to invitations_path
  end

  private

  def set_invitation
    @invitation = Message.find_by(id: params[:id])
  end
end
