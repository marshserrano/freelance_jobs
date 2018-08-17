class FreelancersController < ApplicationController
  def show
    @freelancer = User.find(params[:id])
    @completed_jobs = JobApplication.all
  end
end
