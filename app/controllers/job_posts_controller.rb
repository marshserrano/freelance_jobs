class JobPostsController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @job_posts = JobPost.where(status: "open")
  end

  def show
    @job_post = JobPost.find(params[:id])
  end

  def new
    @job_post = JobPost.new
  end

  def create
    @job_post = current_user.job_posts.build(job_post_params)
    if @job_post.save
      flash[:success] = "Job post has been created!"
      redirect_to dashboard_path
    else
      render 'new'
    end
  end

  def edit
    @job_post = current_user.job_posts.find_by(id: params[:id])
  end

  def update
    @job_post = current_user.job_posts.find_by(id: params[:id])
    if @job_post.update_attributes(job_post_params)
      flash[:success] = "Job post successfully updated!"
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  def destroy
    @job_post.destroy
    flash[:success] = "Job post deleted"
    redirect_to request.referrer || dashboard_path
  end

  private

  def job_post_params
    params.require(:job_post).permit(:name, :description, :skills,
                                     :budget, :hours_of_work, :status,
                                     :user_id)
  end

  def correct_user
    @job_post = current_user.job_posts.find_by(id: params[:id])
    redirect_to dashboard_path if @job_post.nil?
  end
end
