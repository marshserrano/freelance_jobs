class MessagesController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :set_recipient, only: [:new, :create]
  before_action :set_employer, only: [:new, :create]
  before_action :set_job, only: [:new, :create]
  before_action :set_job_posts, only: [:new, :create]

  def status
    @message = Message.where(id: params[:id])
    if params[:decision] == "true"
      @message.update(status: "accepted")
    else
      @message.update(status: "declined")
    end
    redirect_to applicants_path
  end

  def index
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.sent_messages.new(message_params)
    if current_user.freelancer?
      @jobpost_user = JobPost.find_by(id: message_params[:job_post_id])
      @message.recipient_id = @jobpost_user.user_id
    end
    if @message.save
      if current_user.employer?
        flash[:success] = "Job invitation has been sent!"
        redirect_to invites_path
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

  def set_employer
    @employer = User.where(user_type: 'Employer')
  end

  def set_job_posts
    @job_post_all = JobPost.all
  end

  def set_recipient
    @freelancer = User.where(user_type: 'Freelancer')
  end

  def set_job
    @job_post = JobPost.where(user_id: current_user)
  end
end
