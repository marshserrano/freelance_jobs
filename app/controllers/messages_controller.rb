class MessagesController < ApplicationController
  before_action :logged_in_user

  def create
    if current_user.freelancer?
      if current_user.application_limit_reached?
        flash[:danger] = "Application should be not more than 3. Please delete one first."
        redirect_to applications_path
      else
        @message = current_user.sent_messages.new(message_params)
        @jobpost_user = JobPost.find_by(id: message_params[:job_post_id])
        @message.recipient_id = @jobpost_user.user_id
        if @message.save
            flash[:success] = "Job application has been sent!"
            redirect_to applications_path
        else
          render 'new'
        end
      end
    else
      @message = current_user.sent_messages.new(message_params)
      if @message.save
        flash[:success] = "Job invitation has been sent!"
        redirect_to invitations_path
      else
        render 'new'
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :status, :sender_id,
                                    :recipient_id, :job_post_id)
  end
end
