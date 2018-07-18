class JobPostsController < ApplicationController

  def index
    @job_posts = JobPost.all
  end

  def show
    @job_post = JobPost.find(params[:id])
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = current_user.job_posts.create(job_post_params)
    if @job_post.save
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def job_post_params
    params.require(:job_post).permit(:name, :description, :skills, :budget, :hours_of_work, :status, :user_id)
  end
end
