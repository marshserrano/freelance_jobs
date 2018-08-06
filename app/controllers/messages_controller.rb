class MessagesController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

  def create
    @message = current_user.sent_messages.new(message_params)
    if current_user.freelancer?
      @jobpost_user = JobPost.find_by(id: message_params[:job_post_id])
      @message.recipient_id = @jobpost_user.user_id
    end
    if @message.save
      if current_user.employer?
        flash[:success] = "Job invitation has been sent!"
        redirect_to invitations_path
      else
        flash[:success] = "Job application has been sent!"
        redirect_to applications_path
      end
    else
      render 'new'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    if current_user.employer?
      flash[:success] = "Job invitation was successfully deleted."
      redirect_to invitations_path
    else
      flash[:success] = "Job application was successfully deleted."
      redirect_to applications_path
    end
  end

  def jobs_completed
    @messages = Message.all.where("sender_id = ? OR recipient_id = ? OR recipient_id = ? OR sender_id = ?",
                                  current_user.id, @recipient, current_user.id, @sender)
  end

  private

  def message_params
    params.require(:message).permit(:content, :status, :sender_id,
                                    :recipient_id, :job_post_id)
  end
end
