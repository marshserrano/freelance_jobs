class ApplicationsController < ApplicationController

  before_action :application_limit, only: [:new]

  def index
    @applications = Message.where("sender_id = ? OR recipient_id = ?", current_user.id, @recipient)
    @applicants = Message.where("sender_id = ? OR recipient_id = ?", @sender, current_user.id)
  end

  def new
    @application = Message.new
    @job_post = JobPost.where(status: 'open')
  end

  def hire
    @message = Message.find_by(id: params[:id])
    @job_post = JobPost.where(id: @message.job_post_id)
    @message.update(status: "accepted")
    @job_post.update(status: "closed")
    redirect_to applications_path
  end

  private

  def application_limit
    if current_user.freelancer?
      @message = Message.where(sender_id: current_user, status: "pending")
      if @message.count > 2
        flash[:danger] = "Application should be not more than 3. Please delete one first."
        redirect_to  applications_path
      end
    end
  end
end
