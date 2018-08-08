class ActiveJobsController < ApplicationController
  def index
    @active_jobs = Message.where("sender_id = ? OR recipient_id = ? OR
                                  recipient_id = ? OR sender_id = ?",
                                  current_user.id, @recipient,
                                  current_user.id, @sender)
  end

  def complete
    @message = Message.find_by(id: params[:id])
    @job_post = JobPost.where(id: @message.job_post_id)
    @message.update(status: "completed")
    @job_post.update(status: "completed")
    redirect_to completed_jobs_path
  end
end
