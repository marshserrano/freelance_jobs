class InvitationsController < ApplicationController
  def index
    @invitations = Message.where("sender_id = ? OR recipient_id = ?", current_user.id, @recipient)
  end

  def destroy
    @invitation = Message.find(params[:id])
    @invitation.destroy
    flash[:success] = "Application was successfully deleted."
    redirect_to invitations_path
  end
end
