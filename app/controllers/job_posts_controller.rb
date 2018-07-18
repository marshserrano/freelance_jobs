class JobPostsController < ApplicationController

  def index
    @jobposts = JobPost.all
  end

  def show
    @jobpost = JobPost.find(params[:id])
  end

  def new
    @jobpost = JobPost.new
  end

  def create
    @jobpost = JobPost.new(jobpost_params)
    if @jobpost.save
      redirect_to @jobpost
    else
      render 'new'
    end
  end

  def destroy
  end

  private

  def jobpost_params
    params.require(:jobpost).permit(:name, :description, :skills, :budget, :hours_of_work, :status)
  end
end
