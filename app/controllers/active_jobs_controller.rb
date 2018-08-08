class ActiveJobsController < ApplicationController
  def index
    @active_jobs = Message.where("sender_id = ? OR recipient_id = ? OR
                                  recipient_id = ? OR sender_id = ?",
                                  current_user.id, @recipient,
                                  current_user.id, @sender)
  end

  def complete
    @active_jobs = Message.find_by(id: params[:id])
    @job_post = JobPost.where(id: @active_jobs.job_post_id)
    @active_jobs.update(status: "completed")
    @job_post.update(status: "completed")
    redirect_to active_jobs_path
  end
end
