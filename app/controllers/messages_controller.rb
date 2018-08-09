class MessagesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

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

  private

  def message_params
    params.require(:message).permit(:content, :status, :sender_id,
                                    :recipient_id, :job_post_id)
  end
end
