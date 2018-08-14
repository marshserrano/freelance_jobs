class InvitesController < ApplicationController

  def index
    @invites = Invite.all
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
    @post = Post.where(id: @invite.post_id)
    @invite.update(status: 1)
    @post.update(status: 1)
    flash[:success] = "Invite accepted."
    redirect_to invites_path
  end

  def decline
    @invite = Invite.find_by(id: params[:id])
    @invite.update(status: 2)
    flash[:success] = "Invite declined."
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
