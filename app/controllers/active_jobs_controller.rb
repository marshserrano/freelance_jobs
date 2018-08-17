class ActiveJobsController < ApplicationController
  def index
    @active_jobs = JobApplication.all
  end

  def complete
    @active_job = JobApplication.find_by(id: params[:id])
    @post = Post.find_by(id: @active_job.post_id)
    if @active_job.completed?
      flash[:danger] = "Job already completed."
    else
      @active_job.completed!
      @post.completed!
      flash[:success] = "Job completed."
    end
    redirect_to active_jobs_path
  end
end
