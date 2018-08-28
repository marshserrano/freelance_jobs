class InvitesController < ApplicationController

  def index
    if is_employer
      @invites = current_user.sent_invites.pending_or_declined
    else
      @invites = current_user.invites.pending_or_declined
    end
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = current_user.sent_invites.new(invite_params)
    if @invite.save
      flash[:success] = "Invite sent"
      redirect_to invites_path
    else
      render 'new'
    end
  end

  def accept
    @invite = Invite.find_by(id: params[:id])
    @post = Post.find_by(id: @invite.post_id)
    if @invite.accepted?
      flash[:danger] = "Invite already accepted."
    else
      @invite.accepted!
      @post.closed!
      @job_application = current_user.sent_applications.create(
                          content: "I would like to apply", status: "accepted",
                          recipient_id: @post.user_id, post_id: @post.id)
      flash[:success] = "Invite accepted."
    end
    redirect_to invites_path
  end

  def decline
    @invite = Invite.find_by(id: params[:id])
    if @invite.declined?
      flash[:danger] = "Invite already declined."
    else
      @invite.declined!
      flash[:success] = "Invite declined."
    end
    redirect_to invites_path
  end

  def destroy
    @invite = Invite.find_by(id: params[:id])
    @invite.destroy
      flash[:success] = "Invite deleted."
      redirect_to invites_path
  end

  private

  def invite_params
    params.require(:invite).permit(:content, :status, :sender_id,
                                   :recipient_id, :post_id)
  end
end
