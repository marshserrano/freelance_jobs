class ApplicationsController < ApplicationController
  def index
    @applications = Message.where("sender_id = ? OR recipient_id = ?", current_user.id, @recipient)
  end

  def destroy
    @application = Message.find(params[:id])
    @application.destroy
    flash[:success] = "Application was successfully deleted."
    redirect_to applications_path
  end
end
