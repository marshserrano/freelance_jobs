class InvitesController < ApplicationController
  before_action :set_invite, only: [:accept, :decline, :destroy]

  def index
    @invites = current_user.sent_messages
    @invites = current_user.messages
  end

  def new
    @invites = Message.new
    @freelancer = User.where(user_type: 'Freelancer').order(name: :asc)
    @post = current_user.posts.where(status: 'open')
  end

  def accept
    @post = Post.where(id: @invites.post_id)
    @invites.update(status: "accepted")
    @post.update(status: "closed")
    redirect_to invitations_path
  end

  def decline
    @invites.update(status: "declined")
    redirect_to invitations_path
  end

  def destroy
    @invites.destroy
      flash[:success] = "Job invitation was successfully deleted."
      redirect_to invitations_path
  end

  private

  def set_invite
    @invitation = Message.find_by(id: params[:id])
  end
end
