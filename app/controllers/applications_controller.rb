class ApplicationsController < ApplicationController

  def index
    @applications = current_user.applications
    @applicants = current_user.messages
  end

  def new
    @application = Message.new
    @job_post = JobPost.where(status: 'open')
  end

  def accept
    @application = Message.find_by(id: params[:id])
    @job_post = JobPost.where(id: @application.job_post_id)
    @application.update(status: "accepted")
    @job_post.update(status: "closed")
    redirect_to applications_path
  end

  def destroy
    @application = Message.find_by(id: params[:id])
    @application.destroy
      flash[:success] = "Job application was successfully deleted."
      redirect_to applications_path
  end
end
