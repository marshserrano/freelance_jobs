class ActiveJobsController < ApplicationController
  def index
    @active_jobs = Message.sender_or_reciever(current_user.id, current_user.id)
  end

  def complete
    @active_jobs = Message.find_by(id: params[:id])
    @job_post = JobPost.where(id: @active_jobs.job_post_id)
    @active_jobs.update(status: "completed")
    @job_post.update(status: "completed")
    redirect_to active_jobs_path
  end
end
