class MessagesController < ApplicationController
  before_action :logged_in_user

  def create
    @message = current_user.sent_messages.new(message_params)
    if current_user.freelancer?
      if current_user.application_limit_reached?
        flash[:danger] = "Application should be not more than 3. Please delete one first."
        redirect_to applications_path
      else
        @jobpost = JobPost.find_by(id: message_params[:job_post_id])
        @message.recipient_id = @jobpost.user_id
        if @message.save
            flash[:success] = "Job application has been sent!"
            redirect_to applications_path
        else
          render 'new'
        end
      end
    else
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
                                    :recipient_id, :post_id)
  end
end
