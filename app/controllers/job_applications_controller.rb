class JobApplicationsController < ApplicationController

  def index
    @job_applications = current_user.applications
    @applicants = current_user.messages
  end

  def new
    @job_applications = Message.new
    @post = Post.where(status: 'open')
  end

  def accept
    @job_applications = Message.find_by(id: params[:id])
    @post = Post.where(id: @job_applications.post_id)
    @job_applications.update(status: "accepted")
    @post.update(status: "closed")
    redirect_to applications_path
  end

  def destroy
    @job_applications = Message.find_by(id: params[:id])
    @job_applications.destroy
      flash[:success] = "Job application was successfully deleted."
      redirect_to applications_path
  end
end
